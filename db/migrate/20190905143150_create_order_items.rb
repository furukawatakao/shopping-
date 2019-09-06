class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :user_id
      t.integer :quantity
      t.integer :product_id
      t.integer :sum_amount

      t.timestamps
    end
  end
end
