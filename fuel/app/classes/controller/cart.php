<?php

use Fuel\Core\Input;

class Controller_Cart extends Controller_Base
{
  public function get_view_cart()
  {
    $cart = Cart::items();
    $cart_list = array();
    foreach($cart as $item)
    {
      array_push($cart_list, $item->_as_array());
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