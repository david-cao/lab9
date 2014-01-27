class CreateOrdersProducts < ActiveRecord::Migration
  def change
    create_table :orders_products do |t|
      t.integer		:order_id, null:false
      t.integer		:product_id, null:false
      t.timestamps
    end
  end
end
