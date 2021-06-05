<?php
/**
 * Fuel is a fast, lightweight, community driven PHP 5.4+ framework.
 *
 * @package    Fuel
 * @version    1.8.2
 * @author     Fuel Development Team
 * @license    MIT License
 * @copyright  2010 - 2019 Fuel Development Team
 * @link       https://fuelphp.com
 */

/**
 * NOTICE:
 *
 * If you need to make modifications to the default configuration, copy
 * this file to your app/config folder, and make them in there.
 *
 * This will allow you to upgrade fuel without losing your custom config.
 */

return array(
    'driver'                 => 'ormauth',
    'verify_multiple_logins' => false,
    'salt'                   => 'R14c897f323517050b7cfea155cee989f',
    'iterations'             => 10000,
    'table_name' => 'users',
    'table_columns' => array('*'),
    'cache_prefix' => 'auth',
    'multiple_logins' => false,
    'guest_login' => false,
    'remember_me' => array(
        'enabled' => true,
        'cookie_name' => 'rmcookie',
        'expiration' => 86400*31
    ),
    'login_hash_salt' => '3B2Fbn9jfYI',
    'groups' => array(
        -1 => array('name' => 'Banned', 'roles' => array('banned')),
        0 => array('name' => 'Guests', 'roles' => array()),
        1 => array('name' => 'Users', 'roles' => array('user')),
        50 => array('name' => 'Moderators', 'roles' => array('user', 'moderator')),
        100  => array('name' => 'Administrators', 'roles' => array('user', 'moderator', 'admin')),
    ),
);
