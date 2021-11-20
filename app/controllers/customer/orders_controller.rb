class Customer::OrdersController < ApplicationController

  def new
    @customer = current_customer
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_comfirm_path
  end

  def comfirm
    @customer = current_customer
    @order = Order.find(current_customer.id)
  end

  def complete
    @customer = current_customer
  end

  def index
    @customer = current_customer
    @orders = @cutomer.orders
  end

  def show
    @customer = current_customer
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:payment_method, :postal_address, :postal_code, :postal_name, :user_id)
  end
end
