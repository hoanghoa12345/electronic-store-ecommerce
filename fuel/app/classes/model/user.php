<?php

class Model_User extends \Orm\Model
{
	protected static $_properties = array(
		"id" => array(
			"label" => "Id",
			"data_type" => "int",
		),
		"username" => array(
			"label" => "Username",
			"data_type" => "varchar",
		),
		"password" => array(
			"label" => "Password",
			"data_type" => "varchar",
		),
		"firstname" => array(
			"label" => "First Name",
			"data_type" => "varchar",
		),
		"lastname" => array(
			"label" => "Last Name",
			"data_type" => "varchar",
		),
		"group_id" => array(
			"label" => "Group Id",
			"data_type" => "int",
		),
		"email" => array(
			"label" => "Email",
			"data_type" => "varchar",
		),
		"gender" => array(
			"label" => "Gender",
			"data_type" => "enum",
		),
		"birthday" => array(
			"label" => "Birthday",
			"data_type" => "date",
		),
		"phone_number" => array(
			"label" => "Phone Number",
			"data_type" => "varchar",
		),
		"last_login" => array(
			"label" => "Last login",
			"data_type" => "varchar",
		),
		"previous_login" => array(
			"label" => "Previous login",
			"data_type" => "varchar",
		),
		"login_hash" => array(
			"label" => "Login hash",
			"data_type" => "varchar",
		),
		"user_id" => array(
			"label" => "User Id",
			"data_type" => "int",
		),
		"profile_fields" => array(
			"label" => "Profile fields",
			"data_type" => "varchar",
		),
		"avatar" => array(
			"label" => "Avatar",
			"data_type" => "varchar",
		),
		"address" => array(
			"label" => "Address",
			"data_type" => "longtext",
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

	protected static $_table_name = 'users';

	protected static $_primary_key = array('id');

	protected static $_has_many = array(
	);

	protected static $_many_many = array(
	);

	protected static $_has_one = array(
		'customer' => array(
	        'key_from' => 'id',
	        'model_to' => 'Model_Customer',
	        'key_to' => 'user_id',
	        'cascade_save' => true,
	        'cascade_delete' => false,
    	)
	);

	protected static $_belongs_to = array(
	);

}
