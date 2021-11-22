class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  
  def subtotal
    self.add_tax_price*cart_itemproduct_amount.to_i
  end
  
end
