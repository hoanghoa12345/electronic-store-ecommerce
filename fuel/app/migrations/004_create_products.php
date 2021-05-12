<?php

namespace Fuel\Migrations;

use Fuel\Core\DBUtil;

class Create_products
{
	public function up()
	{
		\DBUtil::create_table('products', array(
			'id' => array('type' => 'int', 'unsigned' => true, 'null' => false, 'auto_increment' => true, 'constraint' => 11),
			'title' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'slug' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'category_id' => array('constraint' => 11, 'null' => false, 'type' => 'int', 'unsigned' => true),
			'small_description' => array('constraint' => 1000, 'null' => false, 'type' => 'varchar'),
			'large_description' => array('null' => false, 'type' => 'text'),
			'regular_price' => array('null' => false, 'type' => 'double'),
			'discounted_price' => array('null' => false, 'type' => 'double'),
			'sku' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'quantity' => array('constraint' => 11, 'null' => false, 'type' => 'int'),
			'primary_image' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'other_image' => array('null' => false, 'type' => 'text'),
			'brand_id' => array('constraint' => 11, 'null' => false, 'type' => 'int', 'unsigned' => true),
			'created_at' => array('constraint' => 11, 'null' => true, 'type' => 'int', 'unsigned' => true),
			'updated_at' => array('constraint' => 11, 'null' => true, 'type' => 'int', 'unsigned' => true),
			'child_cat_id' => array('constraint' => 11, 'type' => 'int', 'unsigned' => true, 'null' => false),
			'status' => array('null' => false, 'constraint' => '"active","inactive"', 'default' => 'active', 'type' => 'enum'),
			'colors' => array('null' => true, 'type' => 'text'),
			'specifications' => array('null'=> true, 'type' => 'longtext')
		), array('id'));

		DBUtil::create_index('products',array('category_id','brand_id'));
	}

	public function down()
	{
		DBUtil::drop_index('products',array('category_id','brand_id'));
		\DBUtil::drop_table('products');
	}
}