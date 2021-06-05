<?php

use Fuel\Core\Debug;
use Parser\View;
use Fuel\Core\Response;
use Fuel\Core\Pagination;
use Fuel\Core\Uri;

class Controller_Shop extends Controller_Base
{
  public function action_index()
  {
    $config = array(
      'pagination_url' => Uri::current(),
      'total_items'    => Model_Product::count(),
      'per_page'       => 4,
      'uri_segment'    => 'page',
    );
    
    $pagination = Pagination::forge('mypagination', $config);
    
    $entry = Model_Product::query()->order_by('created_at','desc')
                                ->rows_offset($pagination->offset)
                                ->rows_limit($pagination->per_page)
                                ->get();

    $view = View::forge('frontend/pages/shop.twig');
    $view->products = $entry;
    $view->pagination_links = Pagination::instance('mypagination')->render();
    $view->title = "Tất cả sản phẩm";
    return Response::forge($view);
  }
}