class Customer::CartItemsController < ApplicationController
  
  def index
    @cart_items = current_customer.Cart_item.all
    @total = @cart_items.inject(0) { |sum, product| sum + product.subtotal }
  end
  
  def create
    @cart_item = Cart_item.new(cart_item_params)
    @cart_item.customer.id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end
  
end
