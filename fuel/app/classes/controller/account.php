<?php

class Controller_Account extends Controller_Base
{
  public function action_index()
  {
    $view = View::forge('frontend/account.twig');
    $view->title = "Đăng nhập hoặc tạo tài khoản";
    return Response::forge($view);
  }
}