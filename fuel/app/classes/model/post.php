<?php

class Model_Post extends \Orm\Model
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
		"summary" => array(
			"label" => "Summary",
			"data_type" => "text",
		),
		"description" => array(
			"label" => "Description",
			"data_type" => "text",
		),
		"quote" => array(
			"label" => "Quote",
			"data_type" => "longtext",
		),
		"photo" => array(
			"label" => "Photo",
			"data_type" => "varchar",
		),
		"tags" => array(
			"label" => "Tags",
			"data_type" => "varchar",
		),
		"post_cat_id" => array(
			"label" => "Post cat id",
			"data_type" => "int",
		),
		"added_by" => array(
			"label" => "Added by",
			"data_type" => "int",
		),
		"status" => array(
			"label" => "Status",
			"data_type" => "enum",
		),
		"created_at" => array(
			"label" => "Created at",
			"data_type" => "int",
		),
		"updated_at" => array(
			"label" => "Updated at",
			"data_type" => "int",
		),
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

	protected static $_table_name = 'posts';

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
