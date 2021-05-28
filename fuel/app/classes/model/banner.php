<?php
class Model_Banner extends \Orm\Model
{
  protected static $_properties = array(
    "id" => array(
      "label" => "id",
      "data_type" => "int"
    ),
    "title" => array(
      "label" => "title",
      "data_type" => "varchar"
    ),
    "subtitle" => array(
      "label" => "subtitle",
      "data_type" => "varchar"
    ),
    "image" => array(
      "label" => "",
      "data_type" => "text"
    ),
    "link" => array(
      "label" => "Link shopping",
      "data_type" => "varchar"
    ),
    "type" => array(
      "label" => "",
      "data_type" => "int"
    ),
    "created_at" => array(
      "label" => "",
      "data_type" => "int"
    ),
    "updated_at" => array(
      "label" => "",
      "data_type" =>"int"
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

  protected static $_table_name = 'banners';

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
