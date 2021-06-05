<?php

use Cart\Cart;
use Fuel\Core\Response;
use Fuel\Core\Presenter;
use Fuel\Core\Input;

class Controller_Product extends Controller_Base
{
  public function action_detail()
  {
    return Response::forge(Presenter::forge('frontend/pages/productdetail.twig'));
  }

  public function action_search()
  {
    if(Input::is_ajax()):
    $query = $_GET['query'];
    $results = Model_Product::query()->where('title', 'like', "%$query%")->limit(5)->get();
    $output = '';
    if(count($results)>0){
      foreach($results as $product)
      {
        $price = number_format($product->regular_price,0,'.',',');
        $output .= "\n<li>\n\t<a href=\"/products/$product->slug\">
          <h3> $product->title </h3>
          <span>$price&#8363;</span>
        </a>
      </li>";
      }
    }else{
      $output ="Không tìm thấy sản phẩm nào";
    }
    echo $output;
  endif;
  }

  public function action_addToCart()
  {
    if(Input::is_ajax())
    {
      $product_id = Input::post('product_id');
      $product_quantity = Input::post('quantity');
      $product = Model_Product::find($product_id);


      Cart::add(array(
        'name'  => $product->title,
        'id'    => $product->id,
        'qty'   => $product_quantity,
        'price' => $product->regular_price,
      ));
      echo "Add to cart";
    }
  }

  public function get_view_cart()
  {
    
    $cart = Cart::items();
    //Debug::dump($cart);

    echo Cart::total_price(true,true).'<br>';
    echo Cart::total_qty().'<br>';

    foreach($cart as $item)
    {
      print_r($item->_as_array());
      echo $item->get_id() . '<br>';
      echo $item->get_name() . '<br>';
      //echo $item['image'] . '<br>';
      echo $item->get_price() . '<br>';
      echo $item->get_qty() . '<br>';
      echo "--------------";
    }
  }

}