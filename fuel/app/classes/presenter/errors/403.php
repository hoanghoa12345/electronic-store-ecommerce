<?php
class Presenter_Errors_403 extends Presenter
{
	public function view()
	{
		//$messages = array('Không tìm thấy!', 'Liên kết bị lỗi!', 'Có gì đó không đúng?', 'Có lỗi xảy ra!', 'Mục này không tồn tại!');
		$this->title = '403!';
	}
}