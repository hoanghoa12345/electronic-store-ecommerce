<?php

namespace Fuel\Migrations;

class Create_shippings
{
	public function up()
	{
		\DBUtil::create_table('shipings', array(
			'id' => array('type' => 'int', 'unsigned' => true, 'null' => false, 'auto_increment' => true, 'constraint' => '11'),
			'name' => array('constraint' => '255', 'null' => false, 'type' => 'varchar'),
			'code' => array('constraint' => '129', 'null' => false, 'type' => 'varchar'),
			'price'=> array('null'=>false, 'type'=>'double'),
			'created_at' => array('constraint' => '11', 'null' => true, 'type' => 'int', 'unsigned' => true),
			'updated_at' => array('constraint' => '11', 'null' => true, 'type' => 'int', 'unsigned' => true),
		), array('id'));
	}

	public function down()
	{
		\DBUtil::drop_table('shipings');
	}
}