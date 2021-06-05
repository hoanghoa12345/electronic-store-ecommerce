<?php
use Parser\View;
use Fuel\Core\Response;
class Controller_Admin_Order extends Controller_Admin
{
	public function action_index()
	{
		$view = View::forge('admin/orders/manager.twig');
		$view->title = 'Quản lý đơn hàng';
		$view->subtitle = 'Đơn hàng';
		return Response::forge($view);
	}

  public function action_show()
  {

  }
}