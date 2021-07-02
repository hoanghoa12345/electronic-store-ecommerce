<?php

use Fuel\Core\Debug;
use Fuel\Core\Response;
use Parser\View;
use Fuel\Core\Input;
use Fuel\Core\Session;
use Fuel\Core\Inflector;
use Fuel\Core\Model;
use Auth\Auth;

class Controller_Admin_Settings extends Controller_Admin
{
  public function action_index()
  {
    $view = View::forge('admin/settings/manager.twig');
    $view->title = "Quản lý thiết lập";
    $view->subtitle = "Settings";
    return Response::forge($view);
  }
}