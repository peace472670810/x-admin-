<?php
/**
 * Created by PhpStorm.
 * User: Jim FAN
 * Date: 2017/11/29
 * Time: 15:32
 */

namespace app\service\admin\model;


use think\Model;

class Admins extends Model
{

    /**
     * 根据用户名查找用户信息
     * @param $username
     * @return array
     */
   public function findByUsername($username){
        $admin = $this->query("select * from d_admins where u_username='{$username}' limit 1 ");
        if(empty($admin)){
            return [];
        }
        return $admin[0];
   }

    /**
     * 更新登录
     * @param $admin
     * @return false|int
     */
   public function updateInfo($admin){
        $res = $this->update($admin);
        return $res;
   }
}