<?php

namespace Fuel\Migrations;

class Create_users
{
	public function up()
	{
		\DBUtil::create_table('users', array(
			'id' => array('type' => 'int', 'unsigned' => true, 'null' => false, 'auto_increment' => true, 'constraint' => 11),
			'username' => array('constraint' => 200, 'null' => false, 'type' => 'varchar'),
			'password' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'name' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'group' => array('constraint' => 4, 'null' => false, 'type' => 'int'),
			'email' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'gender' => array('null' => false, 'constraint' => '"male","female","other"', 'type' => 'enum'),
			'birthday' => array('null' => true, 'type' => 'date'),
			'phone_number' => array('constraint' => 18, 'null' => false, 'type' => 'int'),
			'last_login' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'login_hash' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'profile_fields' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'avatar' => array('constraint' => 255, 'null' => false, 'default' => 'users.png', 'type' => 'varchar'),
			'created_at' => array('constraint' => 11, 'null' => true, 'type' => 'int', 'unsigned' => true),
			'updated_at' => array('constraint' => 11, 'null' => true, 'type' => 'int', 'unsigned' => true),
		), array('id'));
	}

	public function down()
	{
		\DBUtil::drop_table('users');
	}
}