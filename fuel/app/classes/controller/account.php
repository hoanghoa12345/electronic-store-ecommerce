<?php

use Auth\Auth;
use Fuel\Core\Debug;
use Fuel\Core\Response;
use Parser\View;
use Fuel\Core\Session;
use Fuel\Core\Input;
use Fuel\Core\Lang;
use Fuel\Core\Arr;
class Controller_Account extends Controller_Base
{
  public function before()
  {
    parent::before();
    if ( ! Auth::check())
    {
        Response::redirect('user/login');
    }
  }

  public function action_index()
  {
    $view = View::forge('frontend/pages/profile.twig');
    $view->title = "Thông tin cá nhân";

    
    try{
      $auth = Auth::instance();

      $user_id = $auth->get_user_id();
      $user = Model_User::find_by_id($user_id[1]);
      $view->user = $user;
    } catch(\Exception $e)
    {
      echo $e->getMessage();
    }

    return Response::forge($view);
  }

  public function action_logout()
	{
    Auth::logout();
    
    Session::set_flash('success', 'Đăng xuất!');
		return Response::redirect('user/login');
  }
  
  public function post_updateInfo()
  {
    #Debug::dump($_POST);

    $user = Model_User::find(Input::post('id'));
    $user->firstname = Input::post('firstname');
    $user->lastname = Input::post('lastname');
    $user->gender = Input::post('gender');
    $user->birthday = Input::post('birthday');
    $user->phone_number = Input::post('phone_number');
    $my_avartar = MyUploadFile::avatar();
    if($my_avartar)
    {
      $user->avatar = $my_avartar;
    }
    
    $user->save();

    Session::set_flash('success', 'Đã cập nhật!');
    Response::redirect('account/index');
  }

  public function action_updateAddress()
  {
    

    if(Input::method() == 'POST')
    {
      //Debug::dump($_POST);
      $user = Model_User::find(Arr::get(Auth::get_user_id(), 1));

      $user->address = Input::post('address');

      $user->save();
      Session::set_flash('success', 'Đã cập nhật!');
      Response::redirect('account/index');
    }
  }
}