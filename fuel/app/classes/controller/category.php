<?php
use Parser\View;
use Fuel\Core\Response;
use Fuel\Core\Presenter;
class Controller_Category extends Controller_Base
{
  public function action_index()
  {
    /*$category = Model_Category::find('first', array(
      'where' => array(
        array('slug', $slug),
    )));
    $category_id = $category->id;
    $entry = Model_Product::find('all', array(
        'where' => array(
            array('category_id', $category_id),
        ),
        'order_by' => array('created_at' => 'desc')
    ));

    $view = View::forge('frontend/pages/productlist.twig');
    $view->category = $category;
    $view->products = $entry;
    $view->title = $category->name;
    return Response::forge($view);*/
    return Response::forge(Presenter::forge('frontend/pages/productlist.twig'));
  }

  public function action_child()
  {
    $category = $this->param('category', 'null');
    $child = $this->param('child', 'null');
    echo $category . $child;
  }
}