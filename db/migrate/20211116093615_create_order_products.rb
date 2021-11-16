class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :product_status
      t.integer :total_price
      t.integer :amount

      t.timestamps
    end
  end
end
