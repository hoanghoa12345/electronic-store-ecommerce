<?php

namespace Fuel\Migrations;

use Fuel\Core\DBUtil;

class Create_users
{
	public function up()
	{
		\DBUtil::create_table('users', array(
			'id' => array('type' => 'int', 'unsigned' => true, 'null' => false, 'auto_increment' => true, 'constraint' => 11),
			'username' => array('constraint' => 200, 'null' => false, 'type' => 'varchar'),
			'password' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'name' => array('constraint' => 255, 'null' => true, 'type' => 'varchar'),
			'group_id' => array('constraint' => 4, 'null' => false, 'type' => 'int'),
			'email' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'gender' => array('null' => true, 'constraint' => '"male","female","other"', 'type' => 'enum'),
			'birthday' => array('null' => true, 'type' => 'date'),
			'phone_number' => array('constraint' => 18, 'null' => true, 'type' => 'varchar'),
			'last_login' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'previous_login' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'login_hash' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'user_id' => array('constraint' => 11, 'type' => 'int', 'unsigned' => true, 'null' => false),
			'profile_fields' => array('constraint' => 255, 'null' => true, 'type' => 'varchar'),
			'avatar' => array('constraint' => 255, 'null' => false, 'default' => 'users.png', 'type' => 'varchar'),
			'created_at' => array('constraint' => 11, 'null' => true, 'type' => 'int', 'unsigned' => true),
			'updated_at' => array('constraint' => 11, 'null' => true, 'type' => 'int', 'unsigned' => true),
		), array('id'));

		DBUtil::create_index('users',array('user_id','group_id'));
	}

	public function down()
	{
		DBUtil::drop_index('users',array('user_id','group_id'));
		\DBUtil::drop_table('users');
	}
}