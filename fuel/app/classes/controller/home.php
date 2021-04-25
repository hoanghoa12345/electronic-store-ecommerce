<?php
class Controller_Home extends Controller
{
  public function action_index()
  {
    $view = View::forge('frontend/home.twig');
    return Response::forge($view);
  }
}