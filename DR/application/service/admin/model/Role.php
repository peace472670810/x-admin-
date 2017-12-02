<?php
/**
 * Created by PhpStorm.
 * User: Jim FAN
 * Date: 2017/12/1
 * Time: 9:30
 * 用户角色
 */

namespace app\service\admin\model;


use think\Model;

class Role extends Model
{
    public function getList(){
      $list =$this->query('select * from d_role where r_level>0');
      return $list;
    }
}