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

// Bootstrap the framework - THIS LINE NEEDS TO BE FIRST!
require COREPATH.'bootstrap.php';
// Add framework overload classes here
\Autoloader::add_classes(array(
  'Twig_Fuel_Extension' => APPPATH . 'classes/twig/fuel/extension.php',
));
// Add framework overload classes here
\Autoloader::add_classes(array(
	'MyUploadFile' => APPPATH.'classes/helper/myuploadfile.php',
));
Autoloader::add_core_namespace('Cart');
Autoloader::add_classes(array(
	'Cart\\Cart'						=> PKGPATH.'/fuel-cart/classes/cart.php',
	'Cart\\InvalidCartException'		=> PKGPATH.'/fuel-cart/classes/cart.php',
	'Cart\\InvalidCartItemException'	=> PKGPATH.'/fuel-cart/classes/cart.php',
	'Cart\\Cart_Item'					=> PKGPATH.'/fuel-cart/classes/cart/item.php',
	'Cart\\Cart_Driver'					=> PKGPATH.'/fuel-cart/classes/cart/driver.php',
	'Cart\\Cart_Cookie'					=> PKGPATH.'/fuel-cart/classes/cart/cookie.php',
));
// Register the autoloader
\Autoloader::register();

/**
 * Your environment.  Can be set to any of the following:
 *
 * Fuel::DEVELOPMENT
 * Fuel::TEST
 * Fuel::STAGING
 * Fuel::PRODUCTION
 */
Fuel::$env = Arr::get($_SERVER, 'FUEL_ENV', Arr::get($_ENV, 'FUEL_ENV', getenv('FUEL_ENV') ?: Fuel::DEVELOPMENT));

// Initialize the framework with the config file.
\Fuel::init('config.php');
// Load Dotenv
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();
require APPPATH . 'common/helper.php';
