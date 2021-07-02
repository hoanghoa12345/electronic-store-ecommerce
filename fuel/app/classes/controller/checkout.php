<?php

use Fuel\Core\Response;
use Parser\View;
use Fuel\Core\Arr;
use Auth\Auth;
use Fuel\Core\Debug;
use Cart\Cart;
use Fuel\Core\Input;
use Fuel\Core\Date;

class Controller_Checkout extends Controller_Base
{
  public function action_index()
  {
    $view = View::forge('frontend/pages/checkout.twig');

    if(Auth::get_user_id()){
      $user = Model_User::find(Arr::get(Auth::get_user_id(), 1));

      //Debug::dump($user);

      $view->user = $user;
    }
    $subtotal = (int) Cart::total_price(false,false);
    $shipping = 125000;
    $total_cart = $subtotal + $shipping;

    $view->title = "Thanh toán";
    $view->subtotal = number_format($subtotal,0,'.',',');
    $view->shipping = number_format($shipping,0,'.',',');
    $view->total_cart = number_format($total_cart,0,'.',',');
    return Response::forge($view);
  }

  public function action_confirm()
  {
    //Debug::dump($_POST);

    try{
      $auth = Auth::instance();

      $user_id = $auth->get_user_id();
      $user = Model_User::find_by_id($user_id[1]);
    } catch(\Exception $e)
    {
      echo $e->getMessage();
    }

    if (Input::method() == 'POST') {
      $order_number = md5(time());
      $subtotal = (int) Cart::total_price(false,false);
      $shipping = 125000;
      $total_cart = $subtotal + $shipping;
      $cart_num_items = Cart::num_items();

      $order                  = new Model_Order();
      $order->order_number	  = $order_number;
      $order->user_id     	  = $user->id;
      $order->sub_total   	  = $subtotal;
      $order->shipping_id  	  = Input::post('shipping');
      $order->coupon      	  = '0';
      $order->total_amount	  = $total_cart;
      $order->quantity    	  = $cart_num_items;
      $order->payment_method	= Input::post('payment');
      $order->payment_status	= 'paid';
      $order->status	        = 'new';
      $order->firstname     	= Input::post('first_name');
      $order->last_name	      = Input::post('last_name');
      $order->email         	= $user->email;
      $order->phone	          = Input::post('phone_number');
      $order->country         = 'Việt Nam';
      $order->address1        = Input::post('address');
      $order->address2        = '';
      if($order->save())
      {
        $id_order = $order->id;
        $cart = Cart::items();
        foreach($cart as $item)
        {
          $order_detail = new Model_Order_Detail();
          $order_detail->order_id	   = $id_order;
          $order_detail->product_id	 = $item->get_id();
          $order_detail->quantity	   = $item->get_qty();
          $order_detail->rate	       = '5.0';
          $order_detail->amount      = $item->get_price(false,false);
          $order_detail->save();
        }
      }
    }
  }

  public function action_getprovince($action)
  {
    $db_json = file_get_contents(DOCROOT. '/files/db.json');
    $db_class = json_decode($db_json);
    switch($action)
    {
      case 'getAllProvince':
        foreach($db_class->province as $province)
        {
          echo "<option value=\"$province->idProvince\">$province->name</option>";
        }
      break;

      case 'getDistrict':
        if(Input::get('idProvince'))
        {
          $idProvince = Input::get('idProvince');
          foreach($db_class->district as $district)
          {
            if($district->idProvince == $idProvince)
              echo "<option value=\"$district->idDistrict\">$district->name</option>";
          }
        }
      break;

      case 'getCommune':
        if(Input::get('idDistrict'))
        {
          $idDistrict = Input::get('idDistrict');
          foreach($db_class->commune as $commune)
          {
            if($commune->idDistrict == $idDistrict)
              echo "<option value=\"$commune->idCoummune\">$commune->name</option>";
          }
        }
      break;
    }
  }
}