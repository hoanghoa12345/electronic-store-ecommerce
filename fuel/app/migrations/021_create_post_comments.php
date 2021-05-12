<?php

namespace Fuel\Migrations;

class Create_post_comments
{
	public function up()
	{
		\DBUtil::create_table('post_comments', array(
			'id' => array('type' => 'int', 'unsigned' => true, 'null' => false, 'auto_increment' => true, 'constraint' => 11),
			'user_id' => array('null' => false, 'type' => 'int', 'unsigned' => true),
			'post_id' => array('null' => false, 'type' => 'int', 'unsigned' => true),
			'comment' => array('null' => false, 'type' => 'text'),
			'status' => array('null' => false, 'constraint' => '"active","unactive"', 'type' => 'enum'),
			'replied_comment' => array('null' => false, 'type' => 'text'),
			'parent_id' => array('null' => false, 'type' => 'int'),
			'created_at' => array('constraint' => 11, 'null' => true, 'type' => 'int', 'unsigned' => true),
			'updated_at' => array('constraint' => 11, 'null' => true, 'type' => 'int', 'unsigned' => true),
		), array('id'));
	}

	public function down()
	{
		\DBUtil::drop_table('post_comments');
	}
}