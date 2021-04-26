<?php
abstract class Controller_Base extends Controller {
 
  public function before()
  {
    $categories = Model_Category::find('all');
    View::set_global('categories', $categories);
  }

}