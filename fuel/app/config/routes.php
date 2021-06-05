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

return array(
	/**
	 * -------------------------------------------------------------------------
	 *  Default route
	 * -------------------------------------------------------------------------
	 *
	 */

	'_root_' => 'home/index',

	/**
	 * -------------------------------------------------------------------------
	 *  Page not found
	 * -------------------------------------------------------------------------
	 *
	 */

	'_403_' => 'error/403',
	'_404_' => 'error/404',
	'_500_' => 'error/500',

	/**
	 * -------------------------------------------------------------------------
	 *  Example for Presenter
	 * -------------------------------------------------------------------------
	 *
	 *  A route for showing page using Presenter
	 *
	 */

	'hello(/:name)?' => array('welcome/hello', 'name' => 'hello'),
	'products(/:name)?' => array('product/detail', 'name'=>'products'),
	'category/(:slug)(/:child)' => array('category/child', 'name'=>'category'),
	'category/(:slug)' => array('category/index', 'name' => 'child_category'),
	'post(/:name)' => array('blog/detail', 'name' => 'post'),
	'login' => 'user/login',
);
