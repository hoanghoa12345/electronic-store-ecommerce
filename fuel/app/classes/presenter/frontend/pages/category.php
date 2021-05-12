<?php
class Presenter_Frontend_Pages_Category extends Presenter
{
	public function view()
	{
    $this->name = $this->request()->param('name', 'null');
    
		$this->bodyClass = 'home page-template full-color-background left-sidebar';
	}
}