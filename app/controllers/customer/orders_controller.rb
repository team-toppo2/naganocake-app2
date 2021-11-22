class Customer::OrdersController < ApplicationController

  def new
    @customer = current_customer
    @order = Order.new #(customer_id: @customer.id)
  end

  def comfirm
    @customer = current_customer
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0" # 自身の住所
      @order.postal_code = current_customer.postal_code
      @order.postal_address = current_customer.address
      @order.postal_name = current_customer.first_name + current_customer.last_name

    elsif params[:order][:select_address] == "1" #登録済みの住所
      @address = PostalAddress.find(params[:order][:postal_address_id])
      @order.postal_code = @address.postal_code
      @order.postal_address = @address.postal_address
      @order.postal_name = @address.postal_name

    elsif params[:order][:select_address] == "2" #新しい住所
      @order = Order.new(address_params)
      # @order.postal_code = params[:postal_address][:postal_code]
      # @order.postal_address = params[:postal_address][:postal_address]
      # @order.postal_name = params[:postal_address][:postal_name]
    end
    #@carts_items = CartItems.find(current_cutomer)?????????
  end

  def create
    @customer = current_customer
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @carts_items = current_customer.cart_items #CartItems.find(current_cutomer)
    # @order.final_price = @carts_items.???????????請求金額算出
    @order.save
    @carts_items.destroy_all
    redirect_to complete_orders_path
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

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_address, :postal_code, :postal_name, :postal_address_id, :select_postal_address_id, :user_id)
  end

  def address_params
    params.require(:order).permit(:postal_address, :postal_code, :postal_name)
  end
end
