<?php

use Fuel\Core\Debug;
use Fuel\Core\Presenter;
use Parser\View;
class Presenter_Frontend_Pages_Productlist extends Presenter
{
	public function view()
	{
    $this->name = $this->request()->param('slug', 'null');
    
    $category = Model_Category::find('first', array(
      'where' => array(
        array('slug', $this->name),
    )));
    $category_id = $category->id;
    $entry = Model_Product::find('all', array(
        'where' => array(
            array('category_id', $category_id),
        ),
        'order_by' => array('created_at' => 'desc')
    ));

    $this->category = $category;
    $this->products = $entry;
    $this->title = $category->name;
	}
}