<?php
return array (
  'version' => 
  array (
    'app' => 
    array (
      'default' => 
      array (
        0 => '001_create_users',
        1 => '002_create_customers',
        2 => '003_create_products',
        3 => '004_create_categories',
        4 => '005_add_foreign_keys_customers_table',
        5 => '006_add_foreign_keys_products_table',
      ),
    ),
    'module' => 
    array (
    ),
    'package' => 
    array (
      'auth' => 
      array (
        0 => '001_auth_create_usertables',
      ),
    ),
  ),
  'folder' => 'migrations/',
  'table' => 'migration',
  'flush_cache' => false,
);
