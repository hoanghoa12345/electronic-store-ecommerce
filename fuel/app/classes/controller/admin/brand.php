<?php

use Fuel\Core\Response;
use Parser\View;
use Fuel\Core\Input;
use Fuel\Core\Session;
use Fuel\Core\Inflector;

class Controller_Admin_Brand extends Controller_Admin
{
  public function action_index()
  {
    $view = View::forge('admin/brand/manager.twig');
    $view->title = "Quản lý nhãn hiệu";
    $view->subtitle = "Nhãn hiệu";
    $view->brands = Model_Brand::find('all');
    return Response::forge($view);
  }

  public function action_create()
	{
		$view = View::forge('admin/brand/manager.twig');
		if (Input::method() == 'POST') {
			$brand = Model_Brand::forge(array(
				'name'  => Input::post('brand_name'),
				'slug'  => to_slug(Input::post('brand_name')),
				'image' => MyUploadFile::brand()
			));

			if ($brand and $brand->save()) {
				Session::set_flash('success', 'Đã thêm brand #' . $brand->id);
				Response::redirect('admin/brand/index');
			} else {
				Session::set_flash('error', 'Chưa thêm được thương hiệu');
			}
		} 
		return Response::forge($view);
	}
	
	public function action_edit($id)
	{
		$view = View::forge('admin/brand/edit.twig');
		$brand = Model_Brand::find($id);
		if (Input::method() == 'POST') {

			$brand->name  = Input::post('brand_name');
			$brand->slug  = to_slug(Input::post('brand_name'));
			$brand->image = MyUploadFile::brand();

			if ($brand->save()) {
				Session::set_flash('success', 'Đã cập nhật brand #' . $brand->id);
				Response::redirect('admin/brand/index');
			} else {
				Session::set_flash('error', 'Chưa thêm được thương hiệu');
			}
		}
		$view->brand = $brand;
		return Response::forge($view);
  }
  
  public function action_delete($id = null)
	{
		$view = View::forge('admin/brand/manager.twig');
		if ($id != null) {
			try {
				$brand = Model_Brand::find($id);
				$brand->delete();
				Session::set_flash('success', 'Đã xóa brand #' . $id);
				Response::redirect('admin/brand/index');
			} catch (Exception $e) {
				Session::set_flash('error', 'Chưa xóa được brand');
			}
		}
		return Response::forge($view);
	}
}