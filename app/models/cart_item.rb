class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  
  def subtotal
    product.add_tax_price * amount
  end
  
end
