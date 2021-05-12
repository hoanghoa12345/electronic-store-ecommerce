<?php

use Cart\Cart;
use Cart\Cart_Item;
use Fuel\Core\Cookie;
use Fuel\Core\Debug;

class Controller_Product extends Controller_Base
{
  public function action_detail()
  {
    return Response::forge(Presenter::forge('frontend/pages/detail.twig'));
  }

  public function action_category()
  {
    return Response::forge(Presenter::forge('frontend/pages/category.twig'));
  }

  public function action_test($slug)
  {
    /*$product = DB::query("SELECT * FROM `products` WHERE `slug` = '$slug'")->as_object('Model_Product')->execute();
    Debug::dump($product);
    print_r($product->as_array());
    echo $product[0]->title;*/
    /*$pro = Model_Product::find('all', array(
      'where' => array(
          array('slug', $slug),
      ),
      'order_by' => array('created_at' => 'desc'),
    ));*/
    $pro = Model_Product::query()->where('slug', $slug);
    //print_r($pro->get_one());
    echo $pro->get_one()->large_description;
  }

  public function action_add_to_cart()
  {
    //Debug::dump($_POST);
    $attribute_pa_color = Input::post('attribute_pa_color');
    $quantity = Input::post('quantity');
    $add_to_cart = Input::post('add_to_cart');
    $product_id = Input::post('product_id');
    $variation_id = Input::post('variation_id');

    $product = Model_Product::find($product_id);

    $rowid = Cart::add(array(
      'name' => $product->title,
      'image' => $product->primary_image,
      'id' => $product_id,
      'qty' => $quantity,
      'price' => $product->discounted_price,
    ));

    //echo $rowid;

    return Response::redirect('shop');
  }

  public function get_view_cart()
  {
    //Debug::dump(Cookie::get('fuel_default_cart'));
    //$cart = Cookie::get('fuel_default_cart');
    
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

  public function action_update_table()
  {
    #color varchar ,active int
    \DBUtil::add_fields('users', array(
        'surname' => array('constraint' => 100, 'type' => 'varchar'),
        'twitter_name' => array('constraint' => 100, 'type' => 'varchar'),
    ));
  }

}