<?php

namespace Fuel\Migrations;

class Add_foreign_keys_products_table
{
	public function up()
	{
		\DBUtil::add_foreign_key('products', array(
		    'constraint' => 'constraint_category_id',
		    'key' => 'category_id',
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
		\DBUtil::drop_foreign_key('products', 'category_id');
	}
}