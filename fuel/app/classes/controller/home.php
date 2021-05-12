<?php
class Controller_Home extends Controller_Base
{
  public function action_index()
  {
    $view = View::forge('frontend/index.twig');
    $view->title = "Điện thoại, Laptop và phụ kiện chính hãng";
    $view->bodyClass = "home page-template page-template-template-homepage-v3 full-color-background";
    return Response::forge($view);
  }

  public function action_category()
  {
    $categories = Model_Category::find('all');
    $arr_category = array();
    foreach ($categories as $category)
    {
      array_push($arr_category,$category->to_array());
    }
    echo json_encode($arr_category);
  }
}