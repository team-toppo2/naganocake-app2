class Customer::OrdersController < ApplicationController
  
  def complete
    @customer = current_customer
  end

  def comfirm
    @customer = current_customer
  end

  def new
    @customer = current_customer
  end

  def create
  end

  def index
    @customer = current_customer
    @user = current_customer
    @orders = @user.orders
  end

  def show
    @customer = current_customer
    @order = Order.find(params[:id])
    @order_producs = @order.order_producs
  end
end
