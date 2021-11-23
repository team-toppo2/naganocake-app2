class AddPostalAddressIdToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :postal_address_id, :integer
  end
end
