<?php

use Auth\Auth;
use Auth\Auth_Login_Ormauth;
use Fuel\Core\Debug;
use Fuel\Core\Response;

class Controller_User extends Controller_Base
{
  public function action_login()
  {
    $view = View::forge('frontend/pages/login.twig');
    $view->title = "Đăng nhập hoặc tạo tài khoản";
    $view->bodyClass = 'home page-template page-template-template-homepage-v3 full-color-background';
    if (Input::method() == 'POST') {
      $email = Input::post('email');
      $password = Input::post('password');
      $auth = Auth::instance();
      if ($auth->login($email, $password)) {
        if (Input::param('rememberCheckbox', false)) {
          Auth::remember_me();
          Session::set_flash('success', 'Remember me');
        } else {
          Auth::dont_remember_me();
        }
        Response::redirect('home');
      } else {
        $data['email']    = Input::param('email');
        $data['login_error'] = Lang::get('login.failure');
        Session::set_flash('error', 'Email, username or password not correct!');
      }
    }
    return Response::forge($view);
  }

  public function action_register()
  {
    $view = View::forge('frontend/pages/register.twig');
    $view->title = "Đăng nhập hoặc tạo tài khoản";
    $view->bodyClass = 'home page-template page-template-template-homepage-v3 full-color-background';
    $view->post = $_POST;
    if (Input::post()) {
      $username = Input::post('username');
      $password = Input::post('password');
      $confirm_password = Input::post('confirm_password');
      $email = Input::post('email');
      if (empty($username) or empty($password) or empty($email))
      {
        Session::set_flash('error','Tên đăng nhập, mật khẩu hoặc địa chỉ email không được để trống, hoặc địa chỉ email không hợp lệ');
        return Response::forge($view);
      }
      if($password != $confirm_password)
      {
        Session::set_flash('error','Mật khẩu và mật khẩu nhập lại không khớp');
        return Response::forge($view);
      }
      $group = 1;
      $profile_fields = array();
      // create a new user
      try
        {
          Auth::create_user($username,$password,$email,$group,$profile_fields);
          Session::set_flash('success', 'User created!');
          Response::redirect('user/login');
        }
        catch (Exception $e)
        {
          $error = $e->getMessage();
          Session::set_flash('error', $error);
        }
    }

    return Response::forge($view);
  }

  public function action_profile()
  {
    if ( ! Auth::check())
    {
        Response::redirect('user/login');
    }
    $view = View::forge('frontend/pages/profile.twig');
    $view->title = "Thông tin cá nhân";
    $view->bodyClass = 'page home page-template-default';
    return Response::forge($view);
  }

  public function action_logout()
	{
		Auth::logout();
		Session::set_flash('success', 'Logged out!');
		Response::redirect('home');
	}
}
