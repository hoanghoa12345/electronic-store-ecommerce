<?php

class Model_Product extends \Orm\Model
{
	protected static $_properties = array(
		"id" => array(
			"label" => "Id",
			"data_type" => "int",
		),
		"title" => array(
			"label" => "Title",
			"data_type" => "varchar",
		),
		"slug" => array(
			"label" => "Slug",
			"data_type" => "varchar",
		),
		"category_id" => array(
			"label" => "Category id",
			"data_type" => "int",
		),
		"small_description" => array(
			"label" => "Small description",
			"data_type" => "varchar",
		),
		"large_description" => array(
			"label" => "Large description",
			"data_type" => "text",
		),
		"regular_price" => array(
			"label" => "Regular price",
			"data_type" => "double",
		),
		"discounted_price" => array(
			"label" => "Discounted price",
			"data_type" => "double",
		),
		"sku" => array(
			"label" => "Sku",
			"data_type" => "varchar",
		),
		"quantity" => array(
			"label" => "Quantity",
			"data_type" => "int",
		),
		"primary_image" => array(
			"label" => "Primary image",
			"data_type" => "varchar",
		),
		"other_image" => array(
			"label" => "Other image",
			"data_type" => "text",
		),
		"brand_id" => array(
			"label" => "Brand id",
			"data_type" => "int",
		),
		"created_at" => array(
			"label" => "Created at",
			"data_type" => "int",
		),
		"updated_at" => array(
			"label" => "Updated at",
			"data_type" => "int",
		),
		"child_cat_id" => array(
			"label" => "Child Category Id",
			"data_type" => "int"
		),
		"status" => array(
			"label" => "Status",
			"data_type" => "enum"
		),
		"colors" => array(
			"label" => "Colors",
			"data_type" => "text"
		),
		"specifications" => array(
			"label" => "Specifications",
			"data_type" => "longtext"
		)
	);

	protected static $_observers = array(
		'Orm\Observer_CreatedAt' => array(
			'events' => array('before_insert'),
			'property' => 'created_at',
			'mysql_timestamp' => false,
		),
		'Orm\Observer_UpdatedAt' => array(
			'events' => array('before_update'),
			'property' => 'updated_at',
			'mysql_timestamp' => false,
		),
	);

	protected static $_table_name = 'products';

	protected static $_primary_key = array('id');

	protected static $_has_many = array(
	);

	protected static $_many_many = array(
	);

	protected static $_has_one = array(
	);

	protected static $_belongs_to = array(
	);

}
