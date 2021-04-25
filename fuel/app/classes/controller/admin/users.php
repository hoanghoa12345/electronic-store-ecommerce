<?php 
class Controller_Admin_Users extends Controller_Admin
{
	public function action_index()
	{
		$data['title'] = 'Quản lý người dùng';
		return Response::forge(View::forge('admin/users/manager.twig',$data));
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