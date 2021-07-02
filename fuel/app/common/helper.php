<?php

use Fuel\Core\Debug;
use Fuel\Core\Uri;
use Auth\Auth;
use Fuel\Core\Request;

if(!function_exists('isActive')) {
  function isActive($routeName)
  {
    return in_array($routeName, Uri::segments()) ? 'active' : '';
  }
}

function isAdmin() {
  return Auth::get('group_id','') == 100 ? true : false;
}

function to_slug($str) {
  $str = trim(mb_strtolower($str));
  $str = preg_replace('/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/', 'a', $str);
  $str = preg_replace('/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/', 'e', $str);
  $str = preg_replace('/(ì|í|ị|ỉ|ĩ)/', 'i', $str);
  $str = preg_replace('/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/', 'o', $str);
  $str = preg_replace('/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/', 'u', $str);
  $str = preg_replace('/(ỳ|ý|ỵ|ỷ|ỹ)/', 'y', $str);
  $str = preg_replace('/(đ)/', 'd', $str);
  $str = preg_replace('/[^a-z0-9-\s]/', '', $str);
  $str = preg_replace('/([\s]+)/', '-', $str);
  return $str;
}

function currentUrl()
{
  return Uri::string();
}

function ellipsisStr($str)
{
  return mb_strimwidth($str,0,42,'...');
}