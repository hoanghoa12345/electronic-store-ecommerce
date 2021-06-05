<?php

use Fuel\Core\Response;
use Parser\View;

class Controller_Blog extends Controller_Base
{
  public function action_index()
  {
    $view = View::forge('frontend/pages/blog.twig');

    return Response::forge($view);
  }

  public function action_detail()
  {
    echo $this->param('name');
  }
}