class Product < ApplicationRecord

  has_many :order_products, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genre

  has_many :orders, through: :order_products
  attachment :image

  def add_tax_price
    (self.price * 1.08).round
  end

end
