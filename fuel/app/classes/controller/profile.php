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
  
  public function action_dashboard()
  {
    $view = View::forge('frontend/pages/profile.twig');
    $view->title = "Thông tin cá nhân";
    $view->bodyClass = 'page home page-template-default';
    return Response::forge($view);
  }
}