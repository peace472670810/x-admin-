<?php
/**
 * Created by PhpStorm.
 * User: Jim FAN
 * Date: 2017/8/21
 * Time: 20:54
 *加密
 */

namespace app\service\common\bussiness;
use app\service\common\model\Xencrypt;

class encrypt
{
    public $xencrypt = null;
    public function __construct()
    {
        $this->xencrypt = new  Xencrypt();
    }

    /**
     * xencrypt 加密
     */
   public function Xencrypt($data = ''){
        $str = $this->xencrypt->encrypt(base64_encode(json_encode($data)));
        return  $str;
   }

    /**
     * xdecrypt解密
     */
   public function Xdecrypt($data = ''){
       $str = $this->xencrypt->decrypt($data);
       return  json_decode(base64_decode($str),true);
   }
}