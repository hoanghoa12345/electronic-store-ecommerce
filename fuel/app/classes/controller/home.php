<?php
use Parser\View;
use Fuel\Core\Response;
class Controller_Home extends Controller_Base
{
  public function action_index()
  {
    $view = View::forge('frontend/index.twig');
    $view->title = "Điện thoại, Laptop và phụ kiện chính hãng";
    $view->carousels = Model_Banner::find('all', array(
      'where' => array(
          array('type', 1),
      )));
    $view->top_images = Model_Banner::find('all', array(
      'where' => array(
          array('type', 2),
      )));
    $view->mid_images = Model_Banner::find('first', array(
      'where' => array(
          array('type', 3),
      )));

    //$view->top_selling = Model_Product::find('all', array('rows_limit' => 8));
    return Response::forge($view);
  }
}