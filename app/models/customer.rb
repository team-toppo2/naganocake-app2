class Customer < ApplicationRecord
  
  has_many :cart_items, dependent: :destroy 
  has_many :orders, dependent: :destroy 
  has_many :postal_addresses, dependent: :destroy 
         
end
