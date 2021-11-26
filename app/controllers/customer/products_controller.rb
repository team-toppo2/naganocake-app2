class Customer::ProductsController < ApplicationController

  def index
    @customer = current_customer
    # 全量出すならProduct.all.page(params[:page]).per(8)
    @products = Product.where(is_active: true).page(params[:page]).per(8)
  end

  def show
    @customer = current_customer
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end


end
