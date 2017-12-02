<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
if (!function_exists('data_encode')) { // 模块间通信统一一个输出标准
    function data_encode($data, $message = 'ok', $code = '')
    {
        return [
            'data' => $data,
            'message' => $message,
            'code' => $code
        ];;
    }
}

if (!function_exists('adminforwarding')) {
    /**
     * 后台转发层跳转
     * @param $class
     * @param $action
     * @param $data
     * @return array|mixed
     */
    function adminforwarding($class, $action, $data)
    {
        try {
            $forwardClass = new \app\forwarding\service\baseforwarding();
            $data = $forwardClass->outPut($service = 'admin', $class, $action, $data);
            return $data;
        } catch (Exception $e) {
            return [
                'data' => false,
                'message' => '转发跳转有误！',
                'code' => '99999999'
            ];
        }
    }
}

if (!function_exists('indexforwarding')) {
    /**前台转发层跳转
     * @param $class
     * @param $action
     * @param $data
     * @return array|mixed
     */
    function indexforwarding($class, $action, $data)
    {
        try {
            $forwardClass = new \app\forwarding\service\baseforwarding();
            $data = $forwardClass->outPut($service = 'index', $class, $action, $data);
            return $data;
        } catch (Exception $e) {
            return [
                'data' => false,
                'message' => '转发跳转有误！',
                'code' => '99999999'
            ];;
        }
    }
}

if (!function_exists('commandforwarding')) {
    /**cli转发层跳转
     * @param $class
     * @param $action
     * @param $data
     * @return array|mixed
     */
    function commandforwarding($class, $action, $data)
    {
        try {
            $forwardClass = new \app\forwarding\service\baseforwarding();
            $data = $forwardClass->outPut($service = 'command', $class, $action, $data);
            return $data;
        } catch (Exception $e) {
            return [
                'data' => false,
                'message' => '转发跳转有误！',
                'code' => '99999999'
            ];;
        }
    }
}
if (!function_exists('encrypt')) {
    /**
     * 后台用于数据加密 decrypt 搭配使用
     * @param $data
     * @return array|mixed
     */
    function encrypt($data)
    {
        if (empty($data)) {
            return [
                'data' => false,
                'message' => '参数不能为空！',
                'code' => '99999998'
            ];
        }
        return adminforwarding('encrypt', 'Xencrypt', $data);
    }
}

if (!function_exists('decrypt')) {
    /**
     * 后台用于数据解密 encrypt 搭配使用
     * @param $data
     * @return array|mixed
     */
    function decrypt($data)
    {
        if (empty($data)) {
            return [
                'data' => false,
                'message' => '参数不能为空！',
                'code' => '99999998'
            ];
        }
        return adminforwarding('encrypt', 'Xdecrypt', $data);
    }
}