<?php

class Controller_Admin_Product extends Controller_Admin
{
  public function action_index()
  {
    //$view = View::forge('admin/product/index.twig');
    return Response::forge(Presenter::forge('admin/product/manager.twig'));
  }
}