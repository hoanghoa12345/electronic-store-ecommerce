<?php

namespace Fuel\Migrations;

class Create_products
{
	public function up()
	{
		\DBUtil::create_table('products', array(
			'id' => array('type' => 'int', 'unsigned' => true, 'null' => false, 'auto_increment' => true, 'constraint' => 11),
			'title' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'slug' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'category_id' => array('constraint' => 11, 'null' => false, 'type' => 'int', 'unsigned' => true, 'index' => true),
			'small_description' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'large_description' => array('null' => false, 'type' => 'text'),
			'regular_price' => array('null' => false, 'type' => 'double'),
			'discounted_price' => array('null' => false, 'type' => 'double'),
			'sku' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'quantity' => array('constraint' => 11, 'null' => false, 'type' => 'int'),
			'primary_image' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'other_image' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'created_at' => array('constraint' => 11, 'null' => true, 'type' => 'int', 'unsigned' => true),
			'updated_at' => array('constraint' => 11, 'null' => true, 'type' => 'int', 'unsigned' => true),
		), array('id'));
	}

	public function down()
	{
		\DBUtil::drop_table('products');
	}
}