<?php
/**
 * Created by PhpStorm.
 * User: Jim FAN
 * Date: 2017/11/28
 * Time: 14:20
 * 提供一个基本的转发层标准
 */

namespace app\forwarding\service;


abstract class forwarding
{
    protected $MODELNAME = null;
    protected $METHOD = null;
    protected $MODEL = null;
    protected $INPUTDATA = null;
    protected $OUTPUTDATA = null;

    /**
     * 初始化
     * @return mixed
     */
    abstract protected function init($service);


    /**
     * 转发返回的内容
     * @return mixed
     */
    abstract protected function outPut($service, $class, $action, $data);

    /**
     * 转发类调用需要调用的类
     * @param $forward
     * @param $data
     * @return mixed
     */
    abstract protected function action($service, $class, $action, $data);
}