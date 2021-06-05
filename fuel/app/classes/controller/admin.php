<?php

use Fuel\Core\Debug;
use Fuel\Core\Input;
use Parser\View;
use Fuel\Core\Response;
use Fuel\Core\HttpNoAccessException;
use Auth\Auth;
use Fuel\Core\Controller;
use Fuel\Core\Arr;
use Fuel\Core\Request;
class Controller_Admin extends Controller
{
	private $current_user;
	public function before()
	{
		if (!Auth::check())
    {
      Response::redirect('user/login');
		}
		$group_id = Auth::get('group_id','');
		if ($group_id != 100)
			throw new HttpNoAccessException;
		$user_id = Auth::get_user_id();
		$user = Model_User::find($user_id[1]);
		/*$this->current_user = Auth::check() ? Model_User::find(Arr::get(Auth::get_user_id(), 1)) : null;
		if ( Auth::get('group_id','') != 100 and Request::active()->action != 'login')
		{
				#Response::redirect('admin/login');
				throw new HttpNoAccessException;
		}*/			
		$this->current_user['name'] = $user->username;
		$this->current_user['avatar'] = $user->avatar;
		View::set_global('current_user', $this->current_user);
		//Debug::dump($this->current_user);
	}

	public function action_index()
	{
		$data['title'] = 'Dashboard';
		$data['orders_num'] = Model_Order::query()->count();
		$data['users_num'] = Model_User::query()->count();
		$data['brands_num'] = Model_Brand::query()->count();
		return Response::forge(View::forge('admin/index.twig',$data));
	}

	public function get_search()
	{
		$params = Input::query_string();
		print_r($params);
		echo $_GET['q'];
	}
}