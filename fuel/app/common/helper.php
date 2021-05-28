<?php

use Fuel\Core\Debug;
use Fuel\Core\Uri;

if(!function_exists('isActive')) {
  function isActive($routeName)
  {
    return in_array($routeName, Uri::segments()) ? 'active' : '';
  }
}