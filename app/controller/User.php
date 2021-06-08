<?php
namespace app\controller;

use app\BaseController;

class User extends BaseController
{
    public function index()
    {
        return '这是user控制器里面的index方法';
    }

    public function hello($name = 'ThinkPHP6')
    {
        return 'hello,' . $name;
    }
    public function login()
    {
        return '这是user登录方法';
    }

}
