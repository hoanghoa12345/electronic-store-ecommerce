<?php

use Fuel\Core\Debug;

class Controller_Shop extends Controller_Base
{
  public function action_index()
  {
    $view = View::forge('frontend/pages/shop.twig');
    $view->title = "Shop";
    $view->bodyClass = "home page-template page-template-template-homepage-v3 full-color-background";
    $products = Model_Product::find('all',array(
      'order_by' => array('created_at' => 'desc')
    ));
    foreach($products as $product)
    {
      $cat_id = $product->category_id;
      $product->category = Model_Category::find($cat_id,array('select' => array('id', 'name')));
    }
    $view->products = $products;
    return Response::forge($view);
  }
}