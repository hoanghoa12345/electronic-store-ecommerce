<?php

namespace Fuel\Migrations;

class Create_coupons
{
	public function up()
	{
		\DBUtil::create_table('coupons', array(
			'id' => array('type' => 'int', 'unsigned' => true, 'null' => false, 'auto_increment' => true, 'constraint' => 11),
			'code' => array('constraint' => 20, 'null' => false, 'type' => 'varchar'),
			'type' => array('null' => false, 'constraint' => '"fixed","percent"', 'type' => 'enum'),
			'value' => array('null' => false, 'type' => 'double'),
			'name' => array('constraint' => 255, 'null' => false, 'type' => 'varchar'),
			'status' => array('null' => false, 'constraint' => '"active","inactive"', 'type' => 'enum'),
			'created_at' => array('constraint' => 11, 'null' => true, 'type' => 'int', 'unsigned' => true),
			'updated_at' => array('constraint' => 11, 'null' => true, 'type' => 'int', 'unsigned' => true),
		), array('id'));
	}

	public function down()
	{
		\DBUtil::drop_table('coupons');
	}
}