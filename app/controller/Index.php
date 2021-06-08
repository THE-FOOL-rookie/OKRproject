<?php
namespace app\controller;

use app\BaseController;
use think\facade\View;
use think\facade\Db;
use think\facade\Request;

class Index extends BaseController
{

   public function index(){
       $param=Request::param('status');

       if(isset($param) && $param ==1){
           $where['status']=1;
       }else if(isset($param) && $param ==2){
           $where['status']=2;
       }else{
           $where=true;
       }
       //总数据量
       $count = Db::table('shop_goods')->where($where)->count();
       //每页数据量
       $num=10;
       //总页数
       $count=ceil($count/$num);
       $page=Request::param('p');
       $p=isset($page)?$page:1;
       //1.查询所有OKR数据
       $list = Db::table('shop_goods')
           ->where($where)
           ->order('add_time DESC')
           ->page($p,$num)
           ->select();
       $data=$list->toArray();
//       dump($list);
//       echo "<hr/>";
//      dump($data);
//       echo "<hr/>";
       //根据分类id查询分类名字,并且值还需要存原数组
       foreach($data as &$data_v){
           $data_v['cat']=Db::table('okr_cat')->where('id',$data_v['cat'])->value('name');
       }
       View::assign([
           'right' => $data,
           'status'=>isset($param)?$param:0,
           'count'=>$count,
           'p'    =>$p

       ]);

       return  view::fetch();
        }

    public function add()
    {
        //判断提交方式 Request::method()
        //dump(Request::method());
        if(Request::method()=="POST"){
            $all=Request::param();
            $insert = Db::table('shop_goods')->insert($all);
            if($insert){
                echo json_encode(['code'=>0,'msg'=>'添加成功']);
            }else{
                echo json_encode(['code'=>1,'msg'=>'添加失败']);
            }


        }else{

            //先查询OKR所有分类
            $cat = Db::table('okr_cat')->where('status',1)->select();
            View::assign([
                'cat' => $cat
            ]);
            return  view::fetch();
        }

    }

    public function edit()
    {
        $id=Request::param('id');
        $shop = Db::table('shop_goods')->where('id',$id)->find();
        $cat = Db::table('okr_cat')->where('status',1)->select();
        View::assign([
            'shop' => $shop,
            'cat' => $cat
        ]);
        return View::fetch();
    //    echo $id;
    }

    public function doedit()
    {
        $all=Request::param();
        $update = Db::table('shop_goods')->where('id',$all['id'])->update($all);
        if($update){
            echo json_encode(['code'=>0,'msg'=>'修改成功']);
        }else{
            echo json_encode(['code'=>1,'msg'=>'修改失败']);
        }

    }

    public function del()
    {
        $id=Request::param('id');
        $delete = Db::table('shop_goods')->where('id',$id)->delete();
        if($delete){
            echo json_encode(['code'=>0,'msg'=>'删除成功']);
            exit;
        }else{
            echo json_encode(['code'=>1,'msg'=>'删除失败']);
            exit;
        }
    }

    public function login()
    {
        return view::fetch();
    }

}
