<?php

use Fuel\Core\Debug;
use Fuel\Core\Presenter;
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
    $this->title = $product->title;
    $this->product = $product;
    $this->product_image = unserialize($this->product->other_image);
	}
}