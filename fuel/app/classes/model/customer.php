<?php

class Model_Customer extends \Orm\Model
{
	protected static $_properties = array(
		"id" => array(
			"label" => "Id",
			"data_type" => "int",
		),
		"user_id" => array(
			"label" => "User id",
			"data_type" => "varchar",
		),
		"province" => array(
			"label" => "Province",
			"data_type" => "varchar",
		),
		"district" => array(
			"label" => "District",
			"data_type" => "varchar",
		),
		"wards" => array(
			"label" => "Wards",
			"data_type" => "varchar",
		),
		"address" => array(
			"label" => "Address",
			"data_type" => "varchar",
		),
	);

	protected static $_observers = array(
	);

	protected static $_table_name = 'customers';

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
