<?php

use Fuel\Core\Debug;
use Fuel\Core\Input;
use Parser\View;
use Fuel\Core\Response;
class Controller_Admin extends Controller
{
	private $current_user;
	public function before()
	{
		if ( ! Auth::check())
    {
        Response::redirect('user/login');
		}

		$group_id = Auth::get('group_id','');
		if ($group_id != 100)
		{
			throw new HttpNoAccessException;
		}
		$user_id = Auth::get_user_id();
		$user = Model_User::find($user_id[1]);
		$this->current_user['name'] = $user->username;
		$this->current_user['avatar'] = $user->avatar;
		View::set_global('current_user', $this->current_user);
	}

	public function action_index()
	{
		$data['title'] = 'Dashboard';
		return Response::forge(View::forge('admin/index.twig',$data));
	}

	public function get_search()
	{
		$params = Input::query_string();
		print_r($params);
		echo $_GET['q'];
	}
}