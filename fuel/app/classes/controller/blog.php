<?php

use Fuel\Core\Debug;
use Fuel\Core\Model;
use Fuel\Core\Response;
use Parser\View;

class Controller_Blog extends Controller_Base
{
  public function action_index()
  {
    $view = View::forge('frontend/pages/blog.twig');
    $view->title = "Bài viết";
    $view->posts = Model_Post::find('all');
    $view->last_posts = Model_Post::find('all', array('order_by' => array('created_at' => 'desc'),'limit'=> 3));
    return Response::forge($view);
  }

  public function action_detail()
  {
    //echo $this->param('name');

    $post = Model_Post::query()->where('slug','=',$this->param('name'))->get_one();
    if($post){
      //Debug::dump($post);
      $view = View::forge('frontend/pages/blogPost.twig');
      $view->title = ellipsisStr($post->title);
      $view->post = $post;
      $view->last_posts = Model_Post::find('all', array('order_by' => array('created_at' => 'desc'),'limit'=> 3));
      $view->comments = Model_Post_Comment::query()->where('post_id','=',$post->id);
      return Response::forge($view);
    }else{
      throw new HttpNotFoundException;
    }
  }
}