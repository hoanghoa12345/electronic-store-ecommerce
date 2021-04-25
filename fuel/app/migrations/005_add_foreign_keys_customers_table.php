<?php

namespace Fuel\Migrations;

class Add_foreign_keys_customers_table
{
	public function up()
	{
		\DBUtil::add_foreign_key('customers', array(
		    'constraint' => 'constraint_user_id',
		    'key' => 'user_id',
		    'reference' => array(
		        'table' => 'users',
		        'column' => 'id',
		    ),
		    'on_update' => 'CASCADE',
		    'on_delete' => 'RESTRICT'
		));
	}

	public function down()
	{
		\DBUtil::drop_foreign_key('customers', 'user_id');
	}
}