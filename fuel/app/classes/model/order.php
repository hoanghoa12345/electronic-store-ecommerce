<?php

class Model_Order extends \Orm\Model
{
	protected static $_properties = array(
		"id" => array(
			"label" => "Id",
			"data_type" => "int",
		),
		"order_number" => array(
			"label" => "order_number",
			"data_type" => "varchar",
		),
		"user_id" => array(
			"label" => "user_id",
			"data_type" => "int",
		),
		"sub_total" => array(
			"label" => "sub_total",
			"data_type" => "double",
		),
		"shipping_id" => array(
			"label" => "shipping_id",
			"data_type" => "int",
		),
		"coupon" => array(
			"label" => "coupon",
			"data_type" => "double",
		),
		"total_amount" => array(
			"label" => "total_amount",
			"data_type" => "double",
		),
		"quantity" => array(
			"label" => "quantity",
			"data_type" => "int",
		),
		"payment_method" => array(
			"label" => "payment_method",
			"data_type" => "enum",
		),
		"payment_status" => array(
			"label" => "payment_status",
			"data_type" => "enum",
		),
		"status" => array(
			"label" => "status",
			"data_type" => "enum",
		),
		"firstname" => array(
			"label" => "firstname",
			"data_type" => "varchar",
		),
		"last_name" => array(
			"label" => "last_name",
			"data_type" => "varchar",
		),
		"email" => array(
			"label" => "email",
			"data_type" => "varchar",
		),
		"phone" => array(
			"label" => "phone",
			"data_type" => "varchar",
		),
		"country" => array(
			"label" => "country",
			"data_type" => "varchar",
		),
		"address1" => array(
			"label" => "address1",
			"data_type" => "text",
		),
		"address2" => array(
			"label" => "address2",
			"data_type" => "text",
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

	protected static $_table_name = 'brands';

	protected static $_primary_key = array('id');

	protected static $_has_many = array();

	protected static $_many_many = array();

	protected static $_has_one = array();

	protected static $_belongs_to = array();
}
