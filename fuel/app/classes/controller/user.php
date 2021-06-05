<?php

use Auth\Auth;
use Fuel\Core\Response;
use Parser\View;
use Fuel\Core\Session;
use Fuel\Core\Input;
use Fuel\Core\Lang;

class Controller_User extends Controller_Base
{
  public function before()
  {
    parent::before();
    if (Auth::check())
    {
      Response::redirect('home');
    }
  }
  public function action_login()
  {
    $view = View::forge('frontend/pages/login.twig');
    $view->title = "Đăng nhập hoặc tạo tài khoản";
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
          //Response::redirect('user/login');
        }
        catch (Exception $e)
        {
          $error = $e->getMessage();
          Session::set_flash('error', $error);
        }
    }

    return Response::forge($view);
  }

  public function action_resetPassword()
  {
    $password = "YNcdskl123";
    if(Input::method() == 'POST')
    {
      $email = Input::post('email_forgot');
    }
    echo "Your email is $email - New password is $password";
  }
}
