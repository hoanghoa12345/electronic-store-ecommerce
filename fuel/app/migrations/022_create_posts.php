<?php

namespace Fuel\Migrations;

class Create_posts
{
	public function up()
	{
		\DBUtil::create_table('posts', array(
			'id' => array('type' => 'int', 'unsigned' => true, 'null' => false, 'auto_increment' => true, 'constraint' => 11),
			'title' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'slug' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'summary' => array('null' => false, 'type' => 'text'),
			'description' => array('null' => false, 'type' => 'text'),
			'quote' => array('null' => false, 'type' => 'longtext'),
			'photo' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'tags' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'post_cat_id' => array('constraint' => 11, 'null' => false, 'type' => 'int', 'unsigned' => true),
			'added_by' => array('constraint' => 11, 'null' => false, 'type' => 'int', 'unsigned' => true),
			'status' => array('null' => false, 'constraint' => '"active","inactive"', 'type' => 'enum'),
			'created_at' => array('constraint' => 11, 'null' => true, 'type' => 'int', 'unsigned' => true),
			'updated_at' => array('constraint' => 11, 'null' => true, 'type' => 'int', 'unsigned' => true),
		), array('id'));
	}

	public function down()
	{
		\DBUtil::drop_table('posts');
	}
}