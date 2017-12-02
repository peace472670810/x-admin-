<?php
/**
 * Created by PhpStorm.
 * User: Jim FAN
 * Date: 2017/11/29
 * Time: 15:32
 */

namespace app\service\admin\bussiness;
use app\service\admin\model\Admins as model;
use app\service\admin\model\Admin_role as model_admin_role;
use app\service\admin\model\Auths as model_auths;
use app\service\admin\model\Role_auth as model_role_auth;
use app\service\admin\model\Role as model_role;
use think\Exception;
use think\Log;

class admins
{
    public $model = null;
    public $model_role = null;
    public $model_auth = null;
    public $model_role_auth = null;
    public $model_admin_role = null;
    public static $PREG = "/\/|\~|\!|\@|\#|\\$|\%|\^|\&|\*|\(|\)|\_|\+|\{|\}|\:|\<|\>|\?|\[|\]|\,|\.|\/|\;|\'|\`|\-|\=|\\\|\|\s+/";
    public static $ERROR_CODE = [
        '20000000' => '账号信息不能为空',
        '20000001' => '密码不能为空',
        '20000002' => '账户长度不能少于6位，且为字母加数字组成',
        '20000003' => '密码长度不能少于8位，且为字母加数字组成',
        '20000004' => '密码错误',
        '20000005' => '用户不存在',
        '20000006' => '验证码错误',
        '20000007' => '登录失败',
        '20000008' => '验证码不能为空',
        '20000009' => '查询时间开始和结算时间不正确！',
        '20000010' => '修改失败！',
        '20000011' => '修改状态参数有误！',
        '20000012' => '退出参数ip有误！',
        '20000013' => '退出参数时间有误！',
    ];
    public function __construct()
    {
        $this->model = new model();
        $this->model_admin_role = new model_admin_role();
        $this->model_role = new model_role();
        $this->model_auth = new model_auths();
        $this->model_role_auth = new model_role_auth();
    }

    /**
     * 用户信息登录
     * @param $data
     */
    public function Login($data){
        try{
            $data = $this->filter('login',$data);
            return data_encode($data,'ok','');
        }catch (Exception $e){
            Log::record('错误位置'.$e->getFile().'-----'.$e->getLine().'-------'.$e->getMessage(),'error');
            return data_encode(false,$e->getMessage(),$e->getCode());
        }
    }

    /**
     *  更新admin状态
     */
    public function updateAdminStatus($data = []){
        $op = $data['op'];
        $sql = 'update d_admins set ';
        try{
            switch ($op){
                case 'loginOut':
                    $sql .=' u_last_time='."'{$data['u_last_time']}'".',u_last_ip='."'{$data['u_last_ip']}'";
                    break;
                case 'is_enabled':
                    $sql .=' u_is_enabled='.$data['u_is_enabled'];
                    break;
                case 'delete':
                    $sql = "delete from  d_admins ";
                    break;
                default:
                    $sql = ' 1 ';
                    break;
            }
            $sql .=' where u_id in ('.$data['u_id'].')';
            $res = $this->model->execute($sql);
            if(!$res){
                return data_encode(false,self::$ERROR_CODE['20000010'],'20000010');
            }else{
                return data_encode(true);
            }
        }catch (Exception $e){
            Log::record('错误位置'.$e->getFile().'-----'.$e->getLine().'-------'.$e->getMessage(),'error');
            return data_encode(false,$e->getMessage(),$e->getCode());
        }
    }
    /**
     * 过滤用户信息
     * @param $data
     */
    protected function filter($op,$data){
        switch ($op){
            case 'login':
                if(empty($data['username'])){
                    throw new Exception(self::$ERROR_CODE['20000000'],'20000000');
                }
                if(empty($data['password'])){
                    throw new Exception(self::$ERROR_CODE['20000001'],'20000001');
                }
                if(strlen($data['username'])<6){
                    throw new Exception(self::$ERROR_CODE['20000002'],'20000002');
                }
                if(strlen($data['password'])<8){
                    throw new Exception(self::$ERROR_CODE['20000003'],'20000003');
                }
                if(empty($data['verifyCode'])){
                    throw new  Exception(self::$ERROR_CODE['20000008'],'20000008');
                }

                if(!captcha_check($data['verifyCode'],'',config('captcha'))){
                    throw new Exception(self::$ERROR_CODE['20000006'],'20000006');
                }
                if($this->checkString($data['username'])){
                    throw new Exception(self::$ERROR_CODE['20000002'],'20000002');
                }
                if($this->checkString($data['password'])){
                    throw new Exception(self::$ERROR_CODE['20000003'],'20000003');
                }
                $admin = $this->model->findByUsername($data['username']);

                if(empty($admin)){
                    throw new Exception(self::$ERROR_CODE['20000005'],'20000005');
                }
                if($this->checkPassword($data['password'],$admin['u_pwd'])){
                    throw new Exception(self::$ERROR_CODE['20000004'],'20000004');
                }
                $admin['u_login_ip'] = $data['ip'];
                $admin['u_login_time'] = date('Y-m-d H:i:s');
                $res = $this->model->updateInfo($admin);
                if($res){
                    return $admin;
                }
                throw new Exception(self::$ERROR_CODE['20000007'],'20000007');
                break;
            case 'list':
                $arr = [];
                    $sql = 'select a.*,r.r_name from  d_admins as a  left JOIN  d_role as r ON a.u_level=r.r_id where 1 ';
                    $sqlcount = 'select count(*)  from  d_admins where 1 ';
                    $where = '';
                    if(!empty($data['start_time']) && !empty($data['end_time'])){
                        $where .= ' and u_login_tim>='.$data['start_time'].' and  u_login_time<='.$data['end_time'];
                    }
                    if(!empty($data['username'])){
                        $where .= " and u_username like '{$data['username']}' ";
                    }
                    $cur = $data['page']<=0?0:$data['page'];
                    $sql .= $where.' limit '.$cur*DEFAULT_PER_PAGE.','.DEFAULT_PER_PAGE;
                    $arr['list'] = $this->model->query($sql);
                    $count = $this->model->query($sqlcount.$where);
                    $arr['count'] = $count[0]['count(*)'];
                    $arr['totalPage'] = ceil($arr['count']/DEFAULT_PER_PAGE);
                    $arr['start'] =  $cur*DEFAULT_PER_PAGE+1;
                    $arr['end'] = ($cur+1)*DEFAULT_PER_PAGE;
                    $arr['cur'] = $cur >= $arr['totalPage']?$arr['totalPage']:($cur+1);
                    return $arr;
                break;
            case 'edit':
                if(empty($data['u_pwd'])){
                    unset($data['u_pwd']);
                }else{
                    $data['u_pwd'] = $this->setPassword($data['u_pwd']);
                }
                $u_id = $data['u_id'];
                unset($data['u_id']);
                $res = $this->model->where('u_id','eq',$u_id)->update($data);
                return $res;
                break;
            case 'add':
                $data['u_pwd'] = $this->setPassword($data['u_pwd']);
                $res = $this->model->insertGetId($data);
                return $res;
               break;
            case 'byId':
                $res = $this->model->find(['u_id'=>$data['u_id']]);
                return $res;
                break;

        }
    }

    /**
     * 根据id管理员信息
     * @param $data
     * @return array
     */
    public  function getAdminById($data){
        $arr['u_id'] = $data['u_id'];
        $res = $this->filter('byId',$data);
        return data_encode($res);
    }
    /**
     * 匹配校验过滤特殊字符串
     * @param $str
     * @return bool
     */
    public function  checkString($str){
        $preg = preg_replace(self::$PREG,'',$str);
        if(strlen($preg) == strlen($str)){
            return false;
        }
        return true;
    }
    /**
     * 设置密码
     * @param $password
     * @return string
     */
    protected function setPassword($password){
        return md5($password);
    }

    /**
     * 校验秘密
     * @param $loginPassowrd
     * @param $oldPassowrd
     * @return bool
     */
    protected function checkPassword($loginPassowrd,$oldPassowrd){
        if($oldPassowrd === $this->setPassword($loginPassowrd)){
            return false;
        }
        return true;
    }

    /**
     * 管理员列表
     * @param array $data
     * @return array
     */
    public function listAdmin($data = []){
        try{
            $list = $this->filter('list',$data);
            return data_encode($list);
        }catch (Exception $e){
            Log::record('错误位置'.$e->getFile().'-----'.$e->getLine().'-------'.$e->getMessage(),'error');
            return data_encode(false,$e->getMessage(),$e->getCode());
        }
    }

    /**
     * 添加管理员
     * @param $data
     * @return array
     */
    public function addAdmin($data){
        try{
            $list = $this->filter('add',$data);
            return data_encode($list);
        }catch (Exception $e){
            Log::record('错误位置'.$e->getFile().'-----'.$e->getLine().'-------'.$e->getMessage(),'error');
            return data_encode(false,$e->getMessage(),$e->getCode());
        }
    }

    /**
     * 修改管理员
     * @param $data
     * @return array
     */
    public function editAdmin($data){
        try{
            $list = $this->filter('edit',$data);
            return data_encode($list);
        }catch (Exception $e){
            Log::record('错误位置'.$e->getFile().'-----'.$e->getLine().'-------'.$e->getMessage(),'error');
            return data_encode(false,$e->getMessage(),$e->getCode());
        }
    }
    /**获取角色列表
     * @return array
     */
    public function roleList($data = []){
        try{
            $res = $this->roleFilter($data['op'],$data);
            return data_encode($res);
        }catch (Exception $e){
            Log::record('错误位置'.$e->getFile().'-----'.$e->getLine().'-------'.$e->getMessage(),'error');
            return data_encode(false,$e->getMessage(),$e->getCode());
        }
    }

    /**
     * 角色管理过滤
     * @param $data
     */
    public function roleFilter($op,$data){
        switch ($op){
            case 'list':
                $where = '';
                if(!empty($data['r_name'])){
                    $where .= " and r_name like '".$data['r_name']."%'";
                }
                $sql = 'select * from d_role where r_id>0  '.$where;
                $sqlcount = 'select count(*) from d_role where r_id>0 '.$where;
                $cur = $data['page']<=0?0:$data['page'];
                $sql .= ' limit '.$cur*DEFAULT_PER_PAGE.','.DEFAULT_PER_PAGE;
                $arr['list'] = $this->model_auth->query($sql);
                $count = $this->model_role->query($sqlcount);
                $arr['count'] = $count[0]['count(*)'];
                $arr['totalPage'] = ceil($arr['count']/DEFAULT_PER_PAGE);
                $arr['start'] =  $cur*DEFAULT_PER_PAGE+1;
                $arr['end'] = ($cur+1)*DEFAULT_PER_PAGE;
                $arr['cur'] = $cur >= $arr['totalPage']?$arr['totalPage']:($cur+1);
                return $arr;
                break;
            case 'add':
                // 1.添加角色表
                $this->model_role->startTrans();
                $role['r_name'] = $data['r_name'];
                $role['r_desc'] = $data['r_desc'];
                $role['r_creator'] = $data['r_creator'];
                $r_id = $this->model_role->insertGetId($role);
                //2.添加到角色关系表
                if(is_array($data['a_id'])){
                    $auth_role = [];
                    foreach ($data['a_id'] as $k=>$v){
                        $auth_role[$k]['ra_r_id'] = $r_id;
                        $auth_role[$k]['ra_a_id'] = $v;
                    }
                    $res = $this->model_role_auth->insertAll($auth_role);
                    if(!$res){
                        $this->model_role->rollback();
                        return false;
                    }else{
                        $this->model_role->commit();
                        return true;
                    }
                }else{
                    $this->model_role->commit();
                    return $r_id;
                }
                break;
            case 'delete':
                //1.删除角色表  2.删除角色权限关系表  删除前必须确定该角色是否有在使用 否则不允许修改
                $r_id = $data['r_id'];

                try{
                    $this->model_role->startTrans();
                    $res = $this->model->query("select u_level from d_admins where u_level=".$r_id);
                    if(!empty($res)) return -1;
                    $this->model_role->query('delete from d_role where r_id in('.$r_id.')');
                    $this->model_role_auth->query('delete from d_role_auth where ra_r_id in ('.$r_id.')');
                    $this->model_role->commit();
                    return true;
                }catch (Exception $e){
                    Log::record('错误位置'.$e->getFile().'-----'.$e->getLine().'-------'.$e->getMessage(),'error');
                    return false;
                }
                break;
            case 'edit':
                //开启事务
                $role['r_name'] = $data['r_name'];
                $role['r_desc'] = $data['r_desc'];
                $this->model_role->startTrans();
                //1.修改role表
                $res = $this->model_role->where('r_id','eq',$data['r_id'])->update($role);
                //2.删除 role_auth表数据
                $this->model_role_auth->query('delete from d_role_auth where ra_r_id='.$data['r_id']);
                //3.新增role_auth表数据
                if(is_array($data['a_id'])) {
                    $auth_role = [];
                    foreach ($data['a_id'] as $k => $v) {
                        $auth_role[$k]['ra_r_id'] = $data['r_id'];
                        $auth_role[$k]['ra_a_id'] = $v;
                    }
                    $res = $this->model_role_auth->insertAll($auth_role);
                    if (!$res) {
                        $this->model_role->rollback();
                        return false;
                    } else {
                        $this->model_role->commit();
                        return true;
                    }
                }else{
                    $this->model_role->commit();
                    return true;
                }
                break;
            case 'getAuth':
                $sql = 'select ra_a_id as a_id from d_role_auth where ra_r_id='.$data['r_id'];
                $role_auth = $this->model_auth->query($sql);
                if(!empty($role_auth)){
                    foreach ($role_auth as $v){
                        $arr['role_auth'][] = $v['a_id'];
                    }
                }else{
                    $arr['role_auth'] = [];
                }
                $role = $this->model_role->query('select * from d_role where r_id='.$data['r_id']);
                $arr['role'] = $role[0];
                return $arr;
                break;
            case 'all':
                $sql = 'select * from d_role where r_id>0';
                $list = $this->model_auth->query($sql);
                return $list;
                break;
        }
    }
    /**
     * 获取权限列表
     */
    public function authList($data){
        try{
            $op = $data['op'];
            $list = $this->authFilter($op,$data);
            return data_encode($list);
        }catch (Exception $e){
            Log::record('错误位置'.$e->getFile().'-----'.$e->getLine().'-------'.$e->getMessage(),'error');
            return data_encode(false,$e->getMessage(),$e->getCode());
        }
    }

    /**
     * 权限管理过滤
     */
    public function authFilter($op,$data){
        switch ($op){
            case 'list':
                $sql = 'select * from d_auths  ';
                $sqlcount = 'select count(*) from d_auths';
                $cur = $data['page']<=0?0:$data['page'];
                $sql .= ' limit '.$cur*DEFAULT_PER_PAGE.','.DEFAULT_PER_PAGE;
                $arr['list'] = $this->model_auth->query($sql);
                $count = $this->model_auth->query($sqlcount);
                $arr['count'] = $count[0]['count(*)'];
                $arr['totalPage'] = ceil($arr['count']/DEFAULT_PER_PAGE);
                $arr['start'] =  $cur*DEFAULT_PER_PAGE+1;
                $arr['end'] = ($cur+1)*DEFAULT_PER_PAGE;
                $arr['cur'] = $cur >= $arr['totalPage']?$arr['totalPage']:($cur+1);
                return $arr;
                break;
            case 'delete':
                $ids = $data['u_id'];
                $sql = 'delete from  d_auths where a_id in('.$ids.')';
                $res = $this->model_auth->execute($sql);
                return $res;
                break;
            case 'add':
                $arr['a_controller'] = $data['controller'];
                $arr['a_action'] = $data['action'];
                $arr['a_name'] = $data['name'];
                $arr['a_type'] = $data['a_type'];
                $res = $this->model_auth->insertGetId($arr);
                return $res;
                break;
            case 'all':
                $list = $this->model_auth->query('select * from d_auths ');
                return $list;
                break;
        }
    }
}