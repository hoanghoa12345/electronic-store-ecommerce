<?php

use Fuel\Core\Debug;

class Presenter_Frontend_Pages_Detail extends Presenter
{
	public function view()
	{
    $this->name = $this->request()->param('name', 'null');
    
    $query = Model_Product::query()->where('slug', $this->name);
    $product = $query->get_one();
    $product->category = Model_Category::find($product->category_id,array('select' => array('id', 'name')));
    $product->brand = Model_Brand::find($product->brand_id,array('select' => array('id', 'name')));
    $this->title = $product->title;
    $this->product = $product;
    $this->bodyClass = 'home page-template full-color-background single-product full-width';
    $this->product_image = unserialize($this->product->other_image);
	}
}