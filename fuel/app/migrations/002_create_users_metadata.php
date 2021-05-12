<?php

namespace Fuel\Migrations;

class Create_users_metadata
{
	public function up()
	{
		\DBUtil::create_table('users_metadata', array(
			'id' => array('type' => 'int', 'unsigned' => true, 'null' => false, 'auto_increment' => true, 'constraint' => '11'),
			'parent_id' => array('constraint' => '11', 'null' => false, 'type' => 'int', 'unsigned' => true),
			'key' => array('constraint' => '255', 'null' => false, 'type' => 'varchar'),
			'value' => array('constraint' => '255', 'null' => false, 'type' => 'varchar'),
			'user_id' => array('constraint' => '11', 'null' => false, 'type' => 'int', 'unsigned' => true),
			'created_at' => array('constraint' => '11', 'null' => true, 'type' => 'int', 'unsigned' => true),
			'updated_at' => array('constraint' => '11', 'null' => true, 'type' => 'int', 'unsigned' => true),
		), array('id'));
	}

	public function down()
	{
		\DBUtil::drop_table('users_metadata');
	}
}