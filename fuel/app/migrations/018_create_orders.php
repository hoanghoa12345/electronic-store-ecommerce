<?php

namespace Fuel\Migrations;

class Create_orders
{
	public function up()
	{
		\DBUtil::create_table('orders', array(
			'id' => array('type' => 'int', 'unsigned' => true, 'null' => false, 'auto_increment' => true, 'constraint' => '11'),
			'order_number' => array('constraint' => '255', 'null' => false, 'type' => 'varchar'),
			'user_id' => array('constraint' => '11', 'null' => false, 'type' => 'int', 'unsigned' => true,),
			'sub_total' => array('null' => false, 'type' => 'double'),
			'shipping_id' => array('constraint' => '11', 'null' => false, 'type' => 'int', 'unsigned' => true,),
			'coupon' => array('null' => false, 'type' => 'double'),
			'total_amount' => array('null' => false, 'type' => 'double'),
			'quantity' => array('constraint' => '11', 'null' => false, 'type' => 'int'),
			'payment_method' => array('null' => false, 'type' => 'enum', 'constraint' => '"cod","bankcard"'),
			'payment_status' => array('null' => false, 'type' => 'enum', 'constraint' => '"paid","unpaid"'),
			'status' => array('null' => false, 'type' => 'enum', 'constraint' => '"new","process","delivered","cancel"'),
			'firstname' => array('constraint' => '255', 'null' => false, 'type' => 'varchar'),
			'last_name' => array('constraint' => '255', 'null' => false, 'type' => 'varchar'),
			'email' => array('constraint' => '255', 'null' => false, 'type' => 'varchar'),
			'phone' => array('constraint' => '255', 'null' => false, 'type' => 'varchar'),
			'country' => array('constraint' => '255', 'null' => false, 'type' => 'varchar'),
			'address1' => array('null' => false, 'type' => 'text'),
			'address2' => array('null' => false, 'type' => 'text'),
			'created_at' => array('constraint' => '11', 'null' => true, 'type' => 'int', 'unsigned' => true),
			'updated_at' => array('constraint' => '11', 'null' => true, 'type' => 'int', 'unsigned' => true),
		), array('id'));

		\DBUtil::add_foreign_key('orders', array(
			'constraint' => 'constraint_orders_user_id',
			'key' => 'user_id',
			'reference' => array(
					'table' => 'users',
					'column' => 'id',
			),
			'on_update' => 'CASCADE',
			'on_delete' => 'RESTRICT'
		));
	}

	public function down()
	{
		\DBUtil::drop_table('orders');
	}
}