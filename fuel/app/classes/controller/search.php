<?php

use Auth\Auth;
use Fuel\Core\Response;
use Parser\View;
use Fuel\Core\Debug;
class Controller_Search extends Controller_Base
{
  public function action_query()
  {
    $keyword = $_GET['query'];
    echo $keyword;
    /*$query = Model_Product::query()->where('title',$keyword);
    Debug::dump($query->limit(6)->get());*/
    Debug::dump(Auth::member(100));
    print_r(Auth::get_groups());

  }
}