<?php

namespace Fuel\Migrations;

use Fuel\Core\DBUtil;

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

		DBUtil::create_index('customers','user_id');
	}

	public function down()
	{
		DBUtil::drop_index('customers','user_id');
		\DBUtil::drop_table('customers');
	}
}