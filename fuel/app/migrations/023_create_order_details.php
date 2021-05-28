<?php

namespace Fuel\Migrations;

class Create_order_details
{
	public function up()
	{
		\DBUtil::create_table('order_details', array(
			'id' => array('type' => 'int', 'unsigned' => true, 'null' => false, 'auto_increment' => true, 'constraint' => 11),
			'order_id' => array('constraint' => 11, 'unsigned' => true, 'null' => false, 'type' => 'int'),
			'product_id' => array('constraint' => 11, 'unsigned' => true, 'null' => false, 'type' => 'int'),
			'quantity' => array('constraint' => 11, 'null' => false, 'type' => 'int'),
			'rate' => array('null' => false, 'type' => 'double'),
			'amount' => array('null' => false, 'type' => 'double'),
			'created_at' => array('constraint' => 11, 'null' => true, 'type' => 'int', 'unsigned' => true),
			'updated_at' => array('constraint' => 11, 'null' => true, 'type' => 'int', 'unsigned' => true),
		), array('id'));
	}

	public function down()
	{
		\DBUtil::drop_table('order_details');
	}
}