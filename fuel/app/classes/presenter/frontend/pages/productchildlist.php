<?php

use Fuel\Core\Debug;
use Fuel\Core\Presenter;
use Parser\View;
class Presenter_Frontend_Pages_Productlist extends Presenter
{
	public function view()
	{
    $this->category = $this->request()->param('category', 'null');
    $this->child = $this->request()->param('child', 'null');
    echo $this->category . $this->child;
  }
}
