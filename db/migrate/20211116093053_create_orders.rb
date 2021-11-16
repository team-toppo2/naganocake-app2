class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shipping_cost
      t.integer :final_price
      t.integer :payment_method
      t.string :postal_name
      t.string :postal_address
      t.string :postal_code
      t.integer :order_status

      t.timestamps
    end
  end
end
