class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      
      t.string 		:status, default:'ordered'
      t.integer		:user_id, null:false #there should never be an order w/o a user

      t.timestamps
    end
  end
end
