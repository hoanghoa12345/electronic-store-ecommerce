<?php

namespace Fuel\Migrations;

class Add_fields_products
{
	public function up()
	{
		\DBUtil::add_fields('products', array(
			'child_cat_id' => array('constraint' => 11, 'type' => 'int', 'unsigned' => true, 'null' => false),
			'status' => array('null' => false, 'constraint' => '"active","inactive"', 'default' => 'active', 'type' => 'enum'),
			'colors' => array('null' => true, 'type' => 'text'),
			'specifications' => array('null'=> true, 'type' => 'longtext')
		));
	}

	public function down()
	{
		\DBUtil::drop_fields('products', array(

		));
	}
}