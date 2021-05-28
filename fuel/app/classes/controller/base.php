<?php
use Fuel\Core\View;
use Fuel\Core\Controller;

abstract class Controller_Base extends Controller {
 
  public function before()
  {
    #$categories = Model_Category::find('all');
    $query = Model_Category::query()->order_by('created_at', 'desc');
    $categories = $query->limit(10)->get();
    foreach($categories as $category)
    {
      $category->childCats = Model_ChildCategory::query()->where('parent_id', '=', $category->id)->get();
    }

    View::set_global('categories', $categories);
  }

}