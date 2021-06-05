<?php

use Fuel\Core\Response;
use Parser\View;
class Controller_Contact extends Controller_Base
{
  public function action_index()
  {
    $view = View::forge('frontend/pages/contact.twig');

    return Response::forge($view);
  }
}