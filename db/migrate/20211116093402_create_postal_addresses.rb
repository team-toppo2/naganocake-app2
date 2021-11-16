class CreatePostalAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :postal_addresses do |t|
      t.integer :customer_id
      t.string :postal_address
      t.string :postal_code
      t.string :postal_name

      t.timestamps
    end
  end
end
