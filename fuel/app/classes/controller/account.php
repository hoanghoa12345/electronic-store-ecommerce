<?php

use Auth\Auth;
use Fuel\Core\Response;
use Parser\View;
use Fuel\Core\Session;
use Fuel\Core\Input;
use Fuel\Core\Lang;

class Controller_Account extends Controller_Base
{
  public function before()
  {
    if ( ! Auth::check())
    {
        Response::redirect('user/login');
    }
  }

  public function action_index()
  {
    $view = View::forge('frontend/pages/profile.twig');
    $view->title = "Thông tin cá nhân";
    return Response::forge($view);
  }

  public function action_logout()
	{
    if(Auth::logout())
    {
      Session::set_flash('success', 'Đăng xuất!');
    }else{
      Session::set_flash('error', "Không thể đăng xuất ngay bây giờ");
    }
		return Response::redirect('user/login');
	}
}