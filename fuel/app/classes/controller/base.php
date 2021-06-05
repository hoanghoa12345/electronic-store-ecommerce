<?php
use Fuel\Core\View;
use Fuel\Core\Controller;
use Cart\Cart;
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
    $cart_num_items = Cart::num_items();


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
    View::set_global('categories', $categories);
    View::set_global('cart_num_items', $cart_num_items);
    View::set_global('cart_items', $cart_arr);
    View::set_global('sub_total',$subtotal);
  }

}