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
				'slug'  => Inflector::friendly_title(Input::post('brand_name'), '-', true)
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