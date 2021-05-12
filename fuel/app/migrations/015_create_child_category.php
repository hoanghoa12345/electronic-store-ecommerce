<?php

namespace Fuel\Migrations;

class Create_child_category
{
	public function up()
	{
		\DBUtil::create_table('child_category', array(
			'id' => array('type' => 'int', 'unsigned' => true, 'null' => false, 'auto_increment' => true, 'constraint' => '11'),
			'parent_id' => array('constraint' => '11', 'unsigned' => true, 'null' => false, 'type' => 'int'),
			'name' => array('constraint' => '255', 'null' => false, 'type' => 'varchar'),
			'slug' => array('constraint' => '255', 'null' => false, 'type' => 'varchar'),
			'created_at' => array('constraint' => '11', 'null' => true, 'type' => 'int', 'unsigned' => true),
			'updated_at' => array('constraint' => '11', 'null' => true, 'type' => 'int', 'unsigned' => true),
		), array('id'));

		\DBUtil::add_foreign_key('child_category', array(
			'constraint' => 'constraint_parent_id',
			'key' => 'parent_id',
			'reference' => array(
					'table' => 'categories',
					'column' => 'id',
			),
			'on_update' => 'CASCADE',
			'on_delete' => 'RESTRICT'
	));
	}

	public function down()
	{
		\DBUtil::drop_foreign_key('child_category', 'constraint_parent_id');
		\DBUtil::drop_table('child_category');
	}
}