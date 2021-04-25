<?php

namespace Fuel\Migrations;

class Create_customers
{
	public function up()
	{
		\DBUtil::create_table('customers', array(
			'id' => array('type' => 'int', 'unsigned' => true, 'null' => false, 'auto_increment' => true, 'constraint' => 11),
			'user_id' => array('constraint' => 11, 'null' => false, 'type' => 'int', 'unsigned' => true, 'index' => true),
			'province' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'district' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'wards' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'address' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
		), array('id'));
	}

	public function down()
	{
		\DBUtil::drop_table('customers');
	}
}