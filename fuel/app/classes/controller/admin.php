<?php
class Controller_Admin extends Controller
{
	public function action_index()
	{
		$data['title'] = 'Dashboard';
		return Response::forge(View::forge('admin/index.twig',$data));
	}
}