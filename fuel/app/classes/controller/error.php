<?php
class Controller_Error extends Controller_Base {

  public function action_404()
	{
		return Response::forge(Presenter::forge('errors/404.twig'), 404);
	}
}