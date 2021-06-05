<?php

use Fuel\Core\Debug;
use Fuel\Core\Presenter;
use Fuel\Core\DB;
class Presenter_Frontend_Pages_Productdetail extends Presenter
{
	public function view()
	{
    $this->name = $this->request()->param('name', 'null');
    
    $query = Model_Product::query()->where('slug', $this->name);
    $product = $query->get_one();
    $product->category = Model_Category::find($product->category_id,array('select' => array('id', 'name')));
    $product->brand = Model_Brand::find($product->brand_id,array('select' => array('id', 'name')));
    $product->child_category = Model_ChildCategory::query()->where('id', '=', $product->child_cat_id)->get_one();
    $related_products = Model_Product::query()->order_by(DB::expr('RAND()'))->limit(4)->get();
    $this->title = $product->title;
    $this->product = $product;
    $this->product_images = unserialize($this->product->other_image);
    $this->related_products = $related_products;
	}
}