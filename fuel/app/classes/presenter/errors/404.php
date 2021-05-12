<?php
class Presenter_Errors_404 extends Presenter
{
	public function view()
	{
		//$messages = array('Không tìm thấy!', 'Liên kết bị lỗi!', 'Có gì đó không đúng?', 'Có lỗi xảy ra!', 'Mục này không tồn tại!');
		$this->title = '404!';
		$this->bodyClass = "page home page-template-default";
	}
}