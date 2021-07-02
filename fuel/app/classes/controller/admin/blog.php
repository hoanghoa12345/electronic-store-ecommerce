<?php

use Fuel\Core\Debug;
use Fuel\Core\Response;
use Parser\View;
use Fuel\Core\Input;
use Fuel\Core\Session;
use Fuel\Core\Inflector;
use Fuel\Core\Model;
use Auth\Auth;

class Controller_Admin_Blog extends Controller_Admin
{
  public function action_index()
  {
    $view = View::forge('admin/post/manager.twig');
    $view->title = "Quản lý bài viết";
    $view->subtitle = "Post";
    $view->posts = Model_Post::find('all');
    return Response::forge($view);
  }

  public function action_create()
  {
    $view = View::forge('admin/post/create.twig');
    $view->title = "Quản lý bài viết";
    $view->subtitle = "Post";
    $categories = Model_Post_Category::find('all',array('where'=> array(array('status','active'))));
    $view->categories = $categories;
    #Debug::dup($categories);
    if(Input::method() == 'POST')
    {
      #Debug::dump($_POST);
      $post = new Model_Post();
      $post->title = Input::post('title');
      $post->slug = to_slug(Input::post('title'));
      $post->summary = Input::post('summary');
      $post->description = Input::post('description');
      $post->quote = Input::post('quote');
      $photo_arr =  MyUploadFile::blog();
      if(!empty($photo_arr))
        $post->photo = $photo_arr[0];

      $post->tags = Input::post('tags');
      $post->post_cat_id = Input::post('category');  
      $user_id = Auth::get_user_id();
      $post->added_by = $user_id[1];
      $post->status = Input::post('status');

      try{
        $post->save();
      }catch(Exception $e)
      {
        echo $e->getMessage();
      }
    }
    return Response::forge($view);
  }

  public function action_edit($id)
  {
    $view = View::forge('admin/post/edit.twig');
    $view->title = "Quản lý bài viết";
    $view->subtitle = "Post";
    $categories = Model_Post_Category::find('all',array('where'=> array(array('status','active'))));
    $view->categories = $categories;
    $post = Model_Post::find($id);
    $view->post = $post;
    if(Input::method() == 'POST')
    {
      $post->title = Input::post('title');
      $post->slug = to_slug(Input::post('title'));
      $post->summary = Input::post('summary');
      $post->description = Input::post('description');
      $post->quote = Input::post('quote');
      $photo_arr =  MyUploadFile::blog();
      if(!empty($photo_arr))
        $post->photo = $photo_arr[0];

      $post->tags = Input::post('tags');
      $post->post_cat_id = Input::post('category');  
      $user_id = Auth::get_user_id();
      $post->added_by = $user_id[1];
      $post->status = Input::post('status');

      try{
        $post->save();
      }catch(Exception $e)
      {
        echo $e->getMessage();
      }
    }
    return Response::forge($view);
  }

  public function action_delete($id)
  {
    $post = Model_Post::find($id);

    if($post)
    {
      $post->delete();
      //echo "lệnh xóa";
    }
    Session::set_flash('success','Xóa thành công!');
    Response::redirect('admin/blog/index');
  }

  public function action_category()
  {
    $view = View::forge('admin/post/category.twig');
    $view->title = "Quản lý danh mục";
    $view->subtitle = "Post";
    $view->post_categories = Model_Post_Category::find('all');

    if(Input::method() == 'POST')
    {
      $post_category = new Model_Post_Category();
      $post_category->title = Input::post('title');
      $post_category->slug = to_slug(Input::post('title'));
      $post_category->status = Input::post('status');

      try {

        $post_category->save();

        Session::set_flash('success','Thêm thành công');
      }catch(Exception $e){
        Session::set_flash('error',$e->getMessage());
      }
    }
    return Response::forge($view);
  }
}