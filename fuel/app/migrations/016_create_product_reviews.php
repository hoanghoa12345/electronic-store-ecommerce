<?php

namespace Fuel\Migrations;

class Create_product_reviews
{
	public function up()
	{
		\DBUtil::create_table('product_reviews', array(
			'id' => array('type' => 'int', 'unsigned' => true, 'null' => false, 'auto_increment' => true, 'constraint' => '11'),
			'product_id' => array('constraint' => '11', 'unsigned' => true, 'null' => false, 'type' => 'int'),
			'user_id' => array('constraint' => '11', 'unsigned' => true, 'null' => false, 'type' => 'int'),
			'rating' => array('null' => false, 'type' => 'double'),
			'status' => array('null' => false, 'constraint' => '"active","inactive"', 'default' => 'active', 'type' => 'enum'),
			'created_at' => array('constraint' => '11', 'null' => true, 'type' => 'int', 'unsigned' => true),
			'updated_at' => array('constraint' => '11', 'null' => true, 'type' => 'int', 'unsigned' => true),
		), array('id'));
		\DBUtil::add_foreign_key('product_reviews', array(
			'constraint' => 'constraint_product_reviews_user_id',
			'key' => 'user_id',
			'reference' => array(
					'table' => 'users',
					'column' => 'id',
			),
			'on_update' => 'CASCADE',
			'on_delete' => 'RESTRICT'
		));
		\DBUtil::add_foreign_key('product_reviews', array(
			'constraint' => 'constraint_product_reviews_product_id',
			'key' => 'product_id',
			'reference' => array(
					'table' => 'products',
					'column' => 'id',
			),
			'on_update' => 'CASCADE',
			'on_delete' => 'RESTRICT'
		));
		
	}

	public function down()
	{
		\DBUtil::drop_foreign_key('product_reviews', 'constraint_product_reviews_user_id');
		\DBUtil::drop_foreign_key('product_reviews', 'constraint_product_reviews_product_id');
		\DBUtil::drop_table('product_reviews');
	}
}