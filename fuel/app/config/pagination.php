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
 * -----------------------------------------------------------------------------
 *  [!] NOTICE
 * -----------------------------------------------------------------------------
 *
 *  If you need to make modifications to the default configuration, copy
 *  this file to your app/config folder, and make them in there.
 *
 *  This will allow you to upgrade FuelPHP without losing your custom config.
 *
 */

return array(
	/**
	 * -------------------------------------------------------------------------
	 *  Active Template
	 * -------------------------------------------------------------------------
	 *
	 *  The template to be used on pagination.
	 *
	 *  You can use other template provided or create your own template. If you
	 *  want to create your own template, you MUST follow template settings
	 *  as described in:
	 *
	 *      https://fuelphp.com/docs/classes/pagination.html#/templating
	 *
	 */

	'active' => 'default',

	/**
	 * -------------------------------------------------------------------------
	 *  Default Template
	 * -------------------------------------------------------------------------
	 *
	 *  This template is compatible with FuelPHP version 1.4 or lower.
	 *
	 *  This template provide basic HTML layout. You may need to add styling on
	 *  your CSS.
	 *<div class="pagination__wrapper">
						<ul class="pagination">
							<li><a href="#0" class="prev" title="previous page">&#10094;</a></li>
							<li>
								<a href="#0" class="active">1</a>
							</li>
							<li>
								<a href="#0">2</a>
							</li>
							<li>
								<a href="#0">3</a>
							</li>
							<li>
								<a href="#0">4</a>
							</li>
							<li><a href="#0" class="next" title="next page">&#10095;</a></li>
						</ul>
					</div>

					<nav aria-label="Page navigation">
	<ul class="pagination">
	
		<li><a href="http://electrostore.xyz/shop/index?page=1" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
		<li><a href="http://electrostore.xyz/shop/index?page=1">1</a></li>
		<li class="active"><a href="#">2 <span class="sr-only">(current)</span></a></li>
		<li><a href="http://electrostore.xyz/shop/index?page=3">3</a></li>
		<li><a href="http://electrostore.xyz/shop/index?page=3" aria-label="Next"><span aria-hidden="true">»</span></a></li>
	</ul>
	</nav>
	 */

	'default' => array(
		/**
		 * ---------------------------------------------------------------------
		 *  Wrapper
		 * ---------------------------------------------------------------------
		 */

		'wrapper' => "<div class=\"pagination__wrapper\">\n\t<ul class=\"pagination\">\n\t{pagination}\n\t</ul>\n\t</div>",
		
		/**
		 * ---------------------------------------------------------------------
		 *  First Page
		 * ---------------------------------------------------------------------
		 */
		
		'first'        => "\n\t\t<li>{link}</li>",
		'first-marker' => "",
		'first-link'   => "<a href=\"{uri}\">{page}</a>",

		/**
		 * ---------------------------------------------------------------------
		 *  First Page - Inactive/Disabled State
		 * ---------------------------------------------------------------------
		 */

		'first-inactive'      => "",
		'first-inactive-link' => "",

		/**
		 * ---------------------------------------------------------------------
		 *  Previous Page
		 * ---------------------------------------------------------------------
		 */

		'previous'        => "\n\t\t<li>{link}</li>",
		'previous-marker' => "&#10094;",
		'previous-link'   => "<a href=\"{uri}\" class=\"prev\" title=\"previous page\">{page}</a>",

		/**
		 * ---------------------------------------------------------------------
		 *  Previous Page - Inactive/Disabled State
		 * ---------------------------------------------------------------------
		 */

		'previous-inactive'      => "\n\t\t<li class=\"disabled\">{link}</li>",
		'previous-inactive-link' => "<a href=\"#\" aria-label=\"Previous\">{page}</a>",

		/**
		 * ---------------------------------------------------------------------
		 *  Pages
		 * ---------------------------------------------------------------------
		 */

		'regular'      => "\n\t\t<li>{link}</li>",
		'regular-link' => "<a href=\"{uri}\">{page}</a>",

		/**
		 * ---------------------------------------------------------------------
		 *  Current Page
		 * ---------------------------------------------------------------------
		 */

		'active'      => "\n\t\t<li>{link}</li>",
		'active-link' => "<a href=\"#\"  class=\"active\">{page} <span class=\"sr-only\">(current)</span></a>",

		/**
		 * ---------------------------------------------------------------------
		 *  Next Page
		 * ---------------------------------------------------------------------
		 */

		'next'        => "\n\t\t<li>{link}</li>",
		'next-marker' => "&#10095;",
		'next-link'   => "<a href=\"{uri}\" class=\"next\" title=\"next page\">{page}</a>",

		/**
		 * ---------------------------------------------------------------------
		 *  Next Page - Inactive/Disabled State
		 * ---------------------------------------------------------------------
		 */

		'next-inactive'      => "\n\t\t<li class=\"disabled\">{link}</li>",
		'next-inactive-link' => "<a href=\"#\" aria-label=\"Next\">{page}</a>",

		/**
		 * ---------------------------------------------------------------------
		 *  Last Page
		 * ---------------------------------------------------------------------
		 */

		'last'        => "\n\t\t<li>{link}</li>",
		'last-marker' => "<span aria-hidden=\"true\">&raquo;&raquo;</span>",
		'last-link'   => "<a href=\"{uri}\">{page}</a>",

		/**
		 * ---------------------------------------------------------------------
		 *  Last Page - Inactive/Disabled State
		 * ---------------------------------------------------------------------
		 */

		'last-inactive'      => "",
		'last-inactive-link' => "",
	),
);
