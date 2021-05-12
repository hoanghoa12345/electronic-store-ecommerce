<?php 
class Controller_Admin_Users extends Controller_Admin
{
	public function action_index()
	{
		$view = View::forge('admin/users/manager.twig');
		$view->title = 'Quản lý người dùng';
		$users = Model_User::find('all');
		foreach($users as $user)
			$user->created_date = Date::forge($user->created_at)->format("%d/%m/%Y", true);
		$view->users = $users;
		return Response::forge($view);
	}

	public function action_add()
	{
		$data['title'] = 'Thêm người dùng';
		$data['description'] = 'Thêm người dùng';
		
		return Response::forge(View::forge('admin/users/add_edit.twig',$data));
	}

	public function action_edit()
	{
		$data['title'] = 'Cập nhật thông tin';
		$data['description'] = 'Cập nhật thông tin';
		return Response::forge(View::forge('admin/users/add_edit.twig',$data));
	}
}