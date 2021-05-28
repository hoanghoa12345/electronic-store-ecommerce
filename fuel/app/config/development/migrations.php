<?php
return array (
  'version' => 
  array (
    'app' => 
    array (
      'default' => 
      array (
        0 => '001_create_users',
        1 => '002_create_users_metadata',
        2 => '003_create_customers',
        3 => '004_create_products',
        4 => '005_create_categories',
        5 => '009_create_brands',
        6 => '011_add_foreign_keys_products_table',
        7 => '012_add_foreign_keys_customers_table',
        8 => '013_create_users_groups',
        9 => '014_add_fields_products',
        10 => '015_create_child_category',
        11 => '016_create_product_reviews',
        12 => '017_create_shippings',
        13 => '018_create_orders',
        14 => '019_create_coupons',
        15 => '020_create_post_categories',
        16 => '021_create_post_comments',
        17 => '022_create_posts',
        18 => '023_create_order_details',
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
        1 => '002_auth_create_grouptables',
        2 => '003_auth_create_roletables',
        3 => '004_auth_create_permissiontables',
        4 => '005_auth_create_authdefaults',
        5 => '006_auth_add_authactions',
        6 => '007_auth_add_permissionsfilter',
        7 => '008_auth_create_providers',
        8 => '009_auth_create_oauth2tables',
        9 => '010_auth_fix_jointables',
        10 => '011_auth_group_optional',
      ),
    ),
  ),
  'folder' => 'migrations/',
  'table' => 'migration',
  'flush_cache' => false,
);
