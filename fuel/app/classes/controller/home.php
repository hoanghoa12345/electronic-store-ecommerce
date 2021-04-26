<?php
class Controller_Home extends Controller_Base
{
  public function action_index()
  {
    $view = View::forge('frontend/home.twig');
    $view->title = "Điện thoại, Laptop và phụ kiện chính hãng";
    return Response::forge($view);
  }

  public function action_404()
	{
		return Response::forge(Presenter::forge('frontend/404.twig'), 404);
	}
}