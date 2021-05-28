<?php

use Fuel\Core\Response;

class Controller_Error extends Controller_Base {

  public function action_404()
	{
		return Response::forge(Presenter::forge('errors/404.twig'), 404);
	}

	public function action_403()
	{
		#echo "Không có quyền truy cập trang này!";
		return Response::forge(View::forge('errors/403.html'),403);
	}
}