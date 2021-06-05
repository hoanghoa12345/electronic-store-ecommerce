<?php

use Fuel\Core\Debug;
use Fuel\Core\Input;
use Fuel\Core\Response;
use Parser\View;
use Fuel\Core\Presenter;
use Fuel\Core\Validation;
use Fuel\Core\Session;
use Fuel\Core\Arr;
use Fuel\Core\Inflector;

class Controller_Admin_Product extends Controller_Admin
{
  public function action_index()
  {
    //$view = View::forge('admin/product/index.twig');
    return Response::forge(Presenter::forge('admin/product/manager.twig'));
  }

  public function action_create()
  {
    $view = View::forge('admin/product/create.twig');
    $view->title = "Quản lý sản phẩm";
    $view->subtitle = "Sản phẩm";
    $view->categories = Model_Category::find('all');
    $view->brands = Model_Brand::find('all');
    $val = Validation::forge();
    $val->add_field('title','Product title','required');
    $val->add_field('category_id','Category ID','required|numeric_min[1]');
    $val->add_field('small_description','Small description','required');
    $val->add_field('large_description','Large description','required');
    $val->add_field('regular_price','Regular price','required');
    $val->add_field('discounted_price','Discounted price','required');
    $val->add_field('sku','SKU','required');
    $val->add_field('quantity','Quantity','required');
    $val->add_field('brand_id','brand_id','required');
    $val->add_field('child_cat_id', 'child_cat_id', 'required|numeric_min[1]');

    if ($val->run())
    {
        // process your stuff when validation succeeds
        $product = new Model_Product();
        $product->title = Input::post('title');
        $product->slug = to_slug(Input::post('title'));
        $product->category_id = Input::post('category_id');
        $product->small_description = Input::post('small_description');
        $product->large_description = Input::post('large_description');
        $product->regular_price = Input::post('regular_price');
        $product->discounted_price = Input::post('discounted_price');
        $product->sku = Input::post('sku');
        $product->quantity = Input::post('quantity');
        $product->brand_id = Input::post('brand_id');
        $product->child_cat_id = Input::post('child_cat_id');
        $product->status = Input::post('status');
        $product->colors = Input::post('colors');
        $product->specifications = Input::post('specifications');
        $product_image = MyUploadFile::product();
        //Debug::dump($my_file);

        $product->primary_image = $product_image[0];
        $product->other_image = serialize($product_image);

        try{
          $product->save();
          Session::set_flash('success', 'Đã thêm sản phẩm #' . $product->id);
				  Response::redirect('admin/product/index');
        }catch(Exception $e)
        {
          Session::set_flash('error', 'Lỗi! chưa thêm được sản phẩm #' . $e->getMessage());
        }
        //Debug::dump($product_image);
    }
    else
    {
        // validation failed
         //Debug::dump($val->error());
         $view->error_field = $val->error();
    }
    $view->post=$_POST;
    //Debug::dump($_POST);
    return Response::forge($view);
  }

  public function action_edit($id=null)
  {
    $view = View::forge('admin/product/edit.twig');
    $view->title = "Edit sản phẩm";
    $view->subtitle = "Sản phẩm";
    try{
      $product = Model_Product::find($id);
      $view->product = $product;
      $categories = Model_Category::find("all");
      $brands = Model_Brand::find("all");
      $view->other_images = unserialize($product->other_image);
    }catch(Exception $e)
    {
      Session::set_flash('error', 'Error' . $e->getMessage());
    }
    $view->categories = $categories;
    $view->brands = $brands;
    $arr_categories = array(-1 => "--Chọn Category--");
    $arr_brands = array(-1 => "--Chọn brand--");
    foreach($categories as $item)
    {
      Arr::set($arr_categories,$item->id,$item->name);
    }
    foreach($brands as $item)
    {
      Arr::set($arr_brands,$item->id,$item->name);
    }
    $view->options_categories = $arr_categories;
    $view->options_brands = $arr_brands;
    //$view->child_category = Model_ChildCategory::find($product->child_cat_id);
    
    if(Input::method() == 'POST'){
        $product = Model_Product::find($id);
        $product->title = Input::post('title');
        $product->slug = Inflector::friendly_title(Input::post('title'), '-', true);
        $product->category_id = Input::post('category_id');
        $product->small_description = Input::post('small_description');
        $product->large_description = Input::post('large_description');
        $product->regular_price = Input::post('regular_price');
        $product->discounted_price = Input::post('discounted_price');
        $product->sku = Input::post('sku');
        $product->quantity = Input::post('quantity');
        $product->other_image = Input::post('other_image');
        $product->brand_id = Input::post('brand_id');
        $product->child_cat_id = Input::post('child_cat_id');
        $product->status = Input::post('status');
        $product->colors = Input::post('colors');
        $product->specifications = Input::post('specifications');

        /*$other_image_0 = Input::post('other_image_0');
        $other_image_1 = Input::post('other_image_1');
        $other_image_2 = Input::post('other_image_2');
        $other_image_3 = Input::post('other_image_3');
        $other_image_4 = Input::post('other_image_4');
        $other_image_5 = Input::post('other_image_5');

        $product_image_arr = array(
          $other_image_0,
          $other_image_1,
          $other_image_2,
          $other_image_3,
          $other_image_4,
          $other_image_5
        );*/

        $product_image = MyUploadFile::product();

        $product->primary_image = $product_image[0];
        $product->other_image = serialize($product_image);
        try {
          $product->save();
          Session::set_flash('success', 'Đã cập nhật!');
          Response::redirect('admin/product/index');
        }catch(Exception $e)
        {
          Session::set_flash('error', 'Error' . $e->getMessage());
        }
        
    }
    //$view->post = Input::post('name', isset($message) ? $message->name : '');
    return Response::forge($view);
  }

  public function post_list_image()
  {
    $id = Input::post('id') ? Input::post('id') : 1;
    $product = Model_Product::find($id);
    $product_image = unserialize($product->other_image);
    echo json_encode($product_image);
  }

  public function action_upload()
	{
		$uploaded = MyUploadFile::product();
		Debug::dump($uploaded);
	}
}