<?php
namespace app\controller;

use app\BaseController;
use think\facade\View;
use think\facade\Db;
use think\facade\Session;
use think\facade\Request;
class Login
{
    public function index()
    {
        if(Request::method() == 'POST'){
            $data=Request::param();
            $admin = Db::table('okr_admin')->where('account',$data['account'])->find();
            if(empty($admin)){
                echo json_encode(['code'=>1,'msg'=>'账号错误']);
                exit();
            }

            if(md5($data['pwd']) != $admin['password']){
                echo json_encode(['code'=>1,'msg'=>'密码错误']);
                exit();
            }
            Session::SET("account",$data['account']);
            echo json_encode(['code'=>0,'msg'=>'登录成功']);


        }else{
            return view::fetch();
        }

    }


}
