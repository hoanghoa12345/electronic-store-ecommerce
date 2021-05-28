<?php

use Fuel\Core\Debug;
use Fuel\Core\Inflector;
use Fuel\Core\Input;
use Fuel\Core\Response;
use Fuel\Core\Session;
use Parser\View;

class Controller_Admin_ChildCategory extends Controller_Admin
{
  public function post_create($parent_id)
  {
    if(Input::method() == 'POST'):
    if(Input::post('child_category_id')){
      $child_category = Model_ChildCategory::find(Input::post('child_category_id'));
    }else{
      $child_category = new Model_ChildCategory();
    }
    $child_category->parent_id=$parent_id;
    $child_category->name=Input::post('child_category_name');
    $child_category->slug=Inflector::friendly_title(Input::post('child_category_name'),'-',true);
    try{
      $child_category->save();
      Session::set_flash('success','Đã cập nhật thành công!');
      Response::redirect('admin/childcategory/view/' . $parent_id);
    }catch(Exception $e)
    {
      Session::set_flash('error','Lỗi:' . $e->getMessage());
      Response::redirect('admin/childcategory/view/' . $parent_id);
    }
    endif;
  }

  public function post_delete()
  {
    $entity = Model_ChildCategory::find(Input::post('child_category_id'));
    $entity->delete();
  }

  public function action_view($parent_id)
  {
    $view = View::forge('admin/category/child_category.twig');
    $view->title = "Danh mục child";
    $view->subtitle = "child category";
    $view->parent_id = $parent_id;
    $view->child_categories =  Model_ChildCategory::find('all', array(
      'where' => array(
          array('parent_id', $parent_id),
      ),
      'order_by' => array('created_at' => 'desc'),
    ));
  
    return Response::forge($view);
  }

  public function action_ajax($parent_id)
  {
    $child_category = Model_ChildCategory::find('all', array(
      'where' => array(
          array('parent_id', $parent_id),
      ),
    ));
    foreach($child_category as $item)
    {
      echo "<option value='$item->id'>$item->name</option>";
    }
  }
}