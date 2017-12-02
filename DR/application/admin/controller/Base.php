<?php
/**
 * Created by PhpStorm.
 * User: Jim FAN
 * Date: 2017/11/28
 * Time: 17:49
 * cookie 加密验证登录
 */

namespace app\admin\controller;
use think\Controller;
use think\Cookie;

class Base extends Controller
{
    /**
     * 记录用户信息
     * @var null
     */
    public $adminInfo = null;
    public $auth_category = [
        1=>'管理员管理',
        2=>'系统管理',
        3=>'抓号管理',
        4=>'奖期管理',
    ];
    public  function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
        $primarykey = Cookie::get('primarykey');
        if($primarykey){
            $adminInfo = decrypt($primarykey);
            if(empty($adminInfo['u_id'])){
                $this->adminInfo = null;
            }else{
                $this->adminInfo = $adminInfo;
                $adminInfo['u_ts'] = date("Y-m-d H:i:s");
                Cookie::set('primarykey',encrypt($adminInfo));
            }
        }
    }

    /**
     * 判断是否登录
     * @return bool
     */
    public function checkUnLogin(){
        if(empty($this->adminInfo)){
            return true;
        }
        return false;
    }

    /**
     * @param $url  链接
     * @param $currentpage  当前页
     * @param $total  总数量
     * @param $start 开始
     * @param $end  结束
     * @param int $countpage  每页数量
     * @return array
     */
    public function getPage($url,$currentpage,$total,$start,$end,$countpage=DEFAULT_PER_PAGE){
        $totalpage = ceil($total/$countpage);
        $res = [
            'start' => $start,
            'end' => $end,
            'total' =>$total,
            'pagecounts' =>$totalpage,
            'pre_url' => '',
            'next_url'=>'',
            'middle' =>'',
        ];
        if($total<$countpage){//只有一页
            $res['pre_url'] = 'javascript:;';
            $res['next_url'] = 'javascript:;';
        }else if($total<=$countpage*5){//小于等于5页
            if($currentpage <=1){
                $res['pre_url'] = "javascript:;";
            }else{
                $pre = ($currentpage-2)<=0?0:($currentpage-2);
                $res['pre_url'] = $url."&page=".$pre;
            }
            for($i=0;$i<$total;$i=$i+$countpage){
                $j = ceil($i/$countpage)+1;
                if($j == $currentpage){
                    $res['middle'] .= "<span class='current' href='".$url."&page=".($j-1)."'>".$j."</span>";
                }else{
                    $res['middle'] .= "<a class='num' href='".$url."&page=".($j-1)."'>".$j."</a>";
                }
            }
            if($currentpage >=$totalpage){
                $res['next_url'] = "javascript:;";
            }else{
                $res['next_url'] = $url."&page=".($currentpage + 1);
            }
            if($currentpage >=$totalpage){
                $res['next_url'] = "javascript:;";
            }else{
                $res['next_url'] = $url."&page=".$currentpage;
            }
        }else{//大于5页
            if($currentpage <=1){
                $res['pre_url'] = "javascript:;";
            }else{
                $pre = ($currentpage-2)<=0?0:($currentpage-2);
                $res['pre_url'] = $url."&page=".$pre;
            }
            //总区间段
            $total_interval = ceil($total/(5*$countpage));
            //取当前页属于哪个区间段
            $f = ceil($currentpage/5);
            //首页
            $res['middle'] ="<a  href='".$url."&page=0'>首页</a>";
            //按区间循环
            if($f<$total_interval){
                $j = ($f-1)*5+1;
                for($i=($f-1)*5*$countpage+1;$i<=$f*5*$countpage;$i=$i+$countpage){
                    if($j == $currentpage){
                        $res['middle'] .= "<span class='current' href='".$url."&page=".($j-1)."'>".$j."</span>";
                    }else{
                        $res['middle'] .= "<a class='num' href='".$url."&page=".($j-1)."'>".$j."</a>";
                    }
                    $j++;
                }
            }else{//到了最后一个区间段
                $j = ($f-1)*5+1;
                for($i=($f-1)*5*$countpage+1;$i<=$total;$i=$i+$countpage){
                    if($j == $currentpage){
                        $res['middle'] .= "<span class='current' href='".$url."&page=".($j-1)."'>".$j."</span>";
                    }else{
                        $res['middle'] .= "<a class='num' href='".$url."&page=".($j-1)."'>".$j."</a>";
                    }
                    $j++;
                }
            }
            //尾页
            $res['middle'] .="<a  href='".$url."&page=".($totalpage-1)."'>尾页</a>";
            if($currentpage >=$totalpage){
                $res['next_url'] = "javascript:;";
            }else{
                $res['next_url'] = $url."&page=".$currentpage;
            }
        }
        $pageStr = '<div class="page">'
                        .'<div>'
            .' <span class="" style="border:none">查询范围从：<span style="color:red;border:none;">'.$res['start'].'</span>到<span style="color:red;border:none;">'.$res['end'].'</span> 条</span>'
                            .'<a class="pre" href="'.$res['pre_url'].'">&lt;&lt;</a>'
                            .$res['middle']
                            .'<a class="next" href="'.$res['next_url'].'">&gt;&gt;</a>'
                            .' <span class="" style="border:none">共有数据：<span style="color:red;border:none;">'.$res['total'].'</span> 条</span>'
                            .' <span class="" style="border:none">共：<span style="color:red;border:none;">'.$totalpage.'</span> 页</span>'
                        .'</div>'
                    .'</div>';
        return  $pageStr;
    }
}