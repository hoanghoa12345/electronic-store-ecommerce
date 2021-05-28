<?php

use Fuel\Core\Asset;
use Fuel\Core\Date;
use Fuel\Core\Debug;
use Fuel\Core\Input;
use Fuel\Core\Response;
use Fuel\Core\Upload;
use Fuel\Core\Inflector;
use Parser\View;
use Fuel\Core\Session;
use Fuel\Core\Image;

class Controller_Admin_Category extends Controller_Admin
{
	public function action_index()
	{
		$view = View::forge('admin/category/manager.twig');

		$view->title = 'Quản lý danh mục';
		$view->categories = Model_Category::find('all');
		return Response::forge($view);
	}

	public function action_create($id = null)
	{
		$view = View::forge('admin/category/manager.twig');
		if (Input::method() == 'POST') {
			$category = Model_Category::forge(array(
				'name'  => Input::post('category_name'),
				'slug'  => Inflector::friendly_title(Input::post('category_name'), '-', true),
				'image' => 'default.png',
			));

			if ($category and $category->save()) {
				Session::set_flash('success', 'Đã thêm category #' . $category->id);
				Response::redirect('admin/category/index');
			} else {
				Session::set_flash('error', 'Chưa thêm được category');
			}
		} 
		return Response::forge($view);
	}

	public function action_delete($id = null)
	{
		$view = View::forge('admin/category/manager.twig');
		if ($id != null) {
			try {
				$category = Model_Category::find($id);
				$category->delete();
				Session::set_flash('success', 'Đã xóa category #' . $id);
				Response::redirect('admin/category/index');
			} catch (Exception $e) {
				Session::set_flash('error', 'Chưa xóa được category');
			}
		}
		return Response::forge($view);
	}

	public function action_edit($id = null)
	{
		$category = Model_Category::find($id);
		if($category)
		{
			$view = View::forge('admin/category/edit.twig');
			$view->title = "Quản lý category";
			$view->subtitle = "Category";
			$view->category = $category;

			if(Input::method() == 'POST'){
				$category->name = Input::post('category_name');
				$category->slug = Input::post('category_slug');
				$category_image_arr = MyUploadFile::banner();
				if(!empty($category_image_arr))
					$category->image = $category_image_arr[0];
				try {

					$category->save();
					Session::set_flash('success', 'Đã sửa category #' . $id);
					Response::redirect('admin/category/index');

				} catch (Exception $e) {
					Session::set_flash('error', 'Chưa sửa được category');
				}
			}
		}else{
			Session::set_flash('Can not find category');
			Response::redirect('/admin/category/index');
		}
		
		$view->id = $id;
		if($id != null)
		{
			try {
				#$category = ;
				$view->category = $category;
			} catch (Exception $e) {
				
			}
			
		}
		return Response::forge($view);
	}

	public function action_date()
	{
		print_r(Date::time());
		echo Date::forge(time())->format("%m/%Y", true);
		Debug::dump(Date::time());
	}

	public function action_image()
	{
		// 'watermark.gif' here replaces the $1 in array('watermark', '$1')
		//Image::load(DOCROOT.'/files/04_2021/79199dcc06baf4cc230262fcbb4d1094.jpg')->preset('mypreset', DOCROOT.'/files/04_2021/ea7e8ed4bc9d6f7c03f5f374e30b183b.png');
		$image = Image::forge();

		// Or with optional config
		$image = Image::forge(array(
				'quality' => 80
		));
		$image->load(DOCROOT.'/files/04_2021/79199dcc06baf4cc230262fcbb4d1094.jpg')
					->crop_resize(200, 200)
					->rounded(100)
					->output();
		// Upload an image and pass it directly into the Image::load method.
		Upload::process(array(
			'path' => DOCROOT.DS.'files'
		));

		if (Upload::is_valid())
		{
			$data = Upload::get_files(0);

			// Using the file upload data, we can force the image's extension
			// via $force_extension
			Image::load($data['file'], false, $data['extension'])
					->crop_resize(200, 200)
					->save('image');
		} 
	}
	public function action_test()
	{
		Asset::add_path(DOCROOT,'img');
		Debug::dump(Asset::img('files/04_2021/78dea821085b77ece03472c20ff0ad37.jpg', 'img'));
		
	}
}
