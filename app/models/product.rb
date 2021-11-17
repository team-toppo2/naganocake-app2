class Product < ApplicationRecord
  
  has_many :order_products, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  
end
