<?php
class Controller_Profile extends Controller_Base
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
}