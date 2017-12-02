<?php
/**
 * Created by PhpStorm.
 * User: Jim FAN
 * Date: 2017/11/28
 * Time: 14:40
 */

namespace app\forwarding\service;

use app\forwarding\service\forwarding;
use think\Exception;
use think\Log;

class baseforwarding extends forwarding
{
    public $serviceconf = null;
    protected static $ERRORCODE = [
        '1000001' => '该类不存在！',
        '1000002' => '类方法不存在！',
        '1000003' => 'service 参数有误！',
        '1000004' => '网络异常',
        '1000005' => '配置文件不存在'
    ];

    /**
     * 初始化配置文件
     * @throws Exception
     */
    protected function init($service)
    {
        // TODO: Implement init() method.
        try {
            if (in_array($service, ['index', 'admin', 'common', 'command'])) {
                $path = __DIR__ . '/../conf/' . $service . 'conf.php';
                if (!file_exists($path)) {
                    Log::record("转发层错误文件" . __FILE__ . '----位置【行】：' . __LINE__ . '----错误信息：类文件信息有误，配置地址' . $path, 'forward_error');
                    throw new Exception(self::$ERRORCODE['1000005'], '1000005');
                }
                $serviceconf = include $path;
                //公共转发配置
                $commonpath = __DIR__ . '/../conf/commonconf.php';
                if (!file_exists($commonpath)) {
                    Log::record("转发层错误文件" . __FILE__ . '----位置【行】：' . __LINE__ . '----错误信息：类文件信息有误，配置地址' . $commonpath, 'forward_error');
                    throw new Exception(self::$ERRORCODE['1000005'], '1000005');
                }
                $commonconf = include $commonpath;
                $this->serviceconf = array_merge($serviceconf, $commonconf);
            } else {
                Log::record("转发层错误文件" . __FILE__ . '----位置【行】：' . __LINE__ . '----错误信息：类文件信息有误，传过来的参数' . json_encode($service), 'forward_error');
                throw new Exception(self::$ERRORCODE['1000003'], '1000003');
            }

        } catch (Exception $e) {
            Log::record("转发层错误文件" . $e->getFile() . '----位置【行】：' . $e->getLine() . '----错误信息：' . $e->getCode() . '---------' . $e->getMessage(), 'forward_error');
            throw new Exception(false, $e->getCode());
        }
    }

    /**
     * 执行这个之前必须先执行init
     * 执行加载类的
     * @param $forward
     * @param $data
     */
    protected function action($service, $class, $action, $data)
    {
        $this->init($service);
        // TODO: Implement action() method.
        $conf = $this->serviceconf;
        if (in_array($class, array_keys($conf))) {
            $model = $conf[$class];
            if (!class_exists($model)) {
                Log::record("转发层错误文件" . __FILE__ . '----位置【行】：' . __LINE__ . '----错误信息：类文件信息有误，类：' . $model, 'forward_error');
                throw new Exception(self::$ERRORCODE['1000003'], '1000003');
            }
            $class = new $model();
            if (!method_exists($class, $action)) {
                Log::record("转发层错误文件" . __FILE__ . '----位置【行】：' . __LINE__ . '----错误信息：类文件信息有误，类方法：' . $action, 'forward_error');
                throw new Exception(self::$ERRORCODE['1000003'], '1000003');
            }
            return $class->$action($data);
        }
    }

    /**
     * 传过来参数
     * @param $data 包含action data
     * @return array|mixed
     */
    public function outPut($service, $class, $action, $data)
    {
        // TODO: Implement outPut() method.
        try {
            $res = $this->action($service, $class, $action, $data);
            return $res;
        } catch (Exception $e) {
            Log::record("转发层错误文件" . $e->getFile() . '----位置【行】：' . $e->getLine() . '----错误信息：' . $e->getMessage(), 'forward_error');
            return data_encode(false, self::$ERRORCODE['1000004'], '1000004');
        }
    }
}