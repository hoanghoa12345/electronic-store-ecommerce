<?php

use Fuel\Core\Debug;
use Fuel\Core\Presenter;
use Parser\View;
class Presenter_Frontend_Pages_ProductChildList extends Presenter
{
	public function view()
	{
    $this->slug = $this->request()->param('slug', 'null');
    $this->child = $this->request()->param('child', 'null');

    $category = Model_Category::find('first', array(
      'where' => array(
        array('slug', $this->slug),
    )));
    $child_category = Model_ChildCategory::find('first', array(
      'where' => array(
        array('slug', $this->child),
      )
    ));
    $category_id = $category->id;
    $child_category_id = $child_category->id;
    $entry = Model_Product::find('all', array(
        'where' => array(
            array('category_id', $category_id),
            array('child_cat_id', $child_category_id)
        ),
        'order_by' => array('created_at' => 'desc')
    ));

    $this->category = $category;
    $this->child_category = $child_category;
    $this->products = $entry;
    $this->title = $category->name;
  }
}
