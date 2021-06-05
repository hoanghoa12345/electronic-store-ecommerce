<?php

use Fuel\Core\Input;
use Cart\Cart;
use Fuel\Core\Debug;
use Fuel\Core\Response;
use Parser\View;
class Controller_Cart extends Controller_Base
{
  
  public function action_index()
  {
    $view = View::forge('frontend/pages/cartList.twig');
    $view->title = "Giỏ hàng";
    Cart::instance();
    $cart_items = Cart::items();
    /*$cart = Cart::instance();
    print_r($cart->items());*/
    $cart_arr = array();
    /*echo $item->get_id() . '<br>';
      echo $item->get_name() . '<br>';
      echo $item->get_qty() . '<br>';
      echo $item->get_rowid() . '<br>';
      echo $item->get_price(false,false) . '<br>';
      echo $item->get_subtotal(false,false) . '<br>';*/
    
    foreach($cart_items as $item)
    {
      $product = Model_Product::find($item->get_id());
      $cart_item_arr = array(
        'id' => $item->get_id(),
        'image' => $product->primary_image,
        'link' => $product->slug,
        'name' => $item->get_name(),
        'qty' => $item->get_qty(),
        'rowid' => $item->get_rowid(),
        'price' => $item->get_price(false,false),
        'subtotal' => $item->get_subtotal(false,false),
      );
      array_push($cart_arr, $cart_item_arr);
    }

    $subtotal = (int) Cart::total_price(false,false);
    $shipping = 125000;
    $total_cart = $subtotal + $shipping;

    $view->subtotal = number_format($subtotal,0,'.',',');
    $view->shipping = number_format($shipping,0,'.',',');
    $view->total_cart = number_format($total_cart,0,'.',',');

    $view->is_empty = empty($cart_arr) ? true : false;
    $view->carts = $cart_arr;
    
    return Response::forge($view);
  }

  public function action_updateQuantity()
  {
    if(Input::is_ajax())
    {
      $rowid = Input::post('rowid');
      $quantity = Input::post('qty');

      $item = Cart::item($rowid);
      $item->update('qty', $quantity);
      echo "Updated qty";
    }
  }

  public function action_cartInfo()
  {
      Cart::instance();
      $cart_items = Cart::items();
      $cart_arr = array();
      
      foreach($cart_items as $item)
      {
        $product = Model_Product::find($item->get_id());
        $cart_item_arr = array(
          'id' => $item->get_id(),
          'image' => $product->primary_image,
          'link' => $product->slug,
          'name' => $item->get_name(),
          'qty' => $item->get_qty(),
          'rowid' => $item->get_rowid(),
          'price' => $item->get_price(false,false),
          'subtotal' => $item->get_subtotal(false,false),
        );
        array_push($cart_arr, $cart_item_arr);
      }

      $subtotal = (int) Cart::total_price(false,false);
      $shipping = 125000;
      $total_cart = $subtotal + $shipping;

      $cart_info = array(
        'carts' => $cart_arr,
        'subtotal' => number_format($subtotal,0,'.',','),
        'shipping' => number_format($shipping,0,'.',','),
        'total_cart' => number_format($total_cart,0,'.',','),
      );
      
      print(json_encode($cart_info));
  }

  public function action_add()
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
      echo Cart::num_items();
    }
  }

  public function action_remove($rowid)
  {
    Cart::remove($rowid);
    Response::redirect('cart/index');
  }

  public function action_info()
  {
      $cart_items = Cart::items();
      Debug::dump($cart_items);
  }

  public function get_view_cart()
  {
    $cart = Cart::items();
    $cart_list = array();
    foreach($cart as $item)
    {
      $cart_item_arr = array(
        'id' => $item->get_id(),
        'name' => $item->get_name(),
        'qty' => $item->get_qty(),
        'rowid' => $item->get_rowid(),
        'price' => $item->get_price(false,false),
        'subtotal' => $item->get_subtotal(false,false),
      );
      array_push($cart_list, $cart_item_arr);
      /*echo $item->get_id() . '<br>';
      echo $item->get_name() . '<br>';
      echo $item->get_qty() . '<br>';
      echo $item->get_rowid() . '<br>';
      echo $item->get_price(false,false) . '<br>';
      echo $item->get_subtotal(false,false) . '<br>';*/

    }
    echo json_encode($cart_list);
  }

  public function get_delete($id)
  {
    if(Input::is_ajax())
    {
    $items = Cart::items();

    foreach($items as $item)
    {
      if($item->get_id() == $id)
      {
        $item->delete();
      }
    }

    echo "Delete product #" . $id;
    }
  }


}