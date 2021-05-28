<?php

use Fuel\Core\Response;
use Parser\View;
use Fuel\Core\Input;
use Fuel\Core\Session;
use Fuel\Core\Inflector;
use Fuel\Core\Model;

#1 - Top Carousel banner 2- three top banner 3 - Mid banner
class Controller_Admin_Banner extends Controller_Admin
{
  public function action_index()
  {
    $view = View::forge('admin/banner/manager.twig');
    $view->title = "Quản lý banner";
    $view->subtitle = "Banner";
    $view->banners = Model_Banner::find('all');
    return Response::forge($view);
  }

  public function action_edit($id)
  {
    $banner = Model_Banner::find($id);
    if($banner)
    {
      $view = View::forge('admin/banner/edit.twig');
      $view->title = "Quản lý banner";
      $view->subtitle = "Banner";
      $view->banner = $banner;

      if(Input::method() == 'POST'){
        $banner->title = Input::post('title');
        $banner->subtitle = Input::post('subtitle');
        $banner->link = Input::post('link');
        $banner->type = Input::post('type');

        $arr_banner_image = MyUploadFile::banner();
        

        if(!empty($arr_banner_image))
        {
          $banner->image = $arr_banner_image[0];
        }
        try{
          $banner->save();
          Session::set_flash('success', 'Đã cập nhật banner #' . $banner->id);
          Response::redirect('admin/banner/index');
        }catch(Exception $e)
        {
          Session::set_flash('error', 'Lỗi:' . $e->getMessage());
        }
      }
      return Response::forge($view);
    }else{
      Response::redirect('admin/banner/index');
    }
  }

  public function action_three_image()
  {
    $view = View::forge('admin/banner/three_image.twig');
    $view->title = "Quản lý banner";
    $view->subtitle = "Banner";
    $view->top_images = Model_Banner::find('all', array(
      'where' => array(
          array('type', 2),
      )));
    return Response::forge($view);
  }

  public function action_delete_image()
  {
    $path = Input::query_string();
    $real_path_img = DOCROOT . $path;
    echo $real_path_img;
    if(file_exists($real_path_img))
      unlink($real_path_img);
  }
}