<?php

use Fuel\Core\Response;
use Parser\View;
use Fuel\Core\Arr;
use Auth\Auth;
use Fuel\Core\Debug;
use Cart\Cart;

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
    echo "Thành công";
  }
}