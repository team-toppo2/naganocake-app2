class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_jp
      t.string :first_name_jp
      t.string :email
      t.string :postal_code
      t.text :address
      t.string :telephone_number
      t.string :encrypted_password
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
