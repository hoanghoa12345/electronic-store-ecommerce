<?php

class Controller_Account extends Controller
{
  public function action_index()
  {
    $view = View::forge('frontend/account.twig');
    return Response::forge($view);
  }
}