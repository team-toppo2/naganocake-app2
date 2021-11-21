class Customer::OrdersController < ApplicationController

  def new
    @customer = current_customer
    @order = Order.new #(customer_id: @customer.id)
  end

  def create
    @customer = current_customer
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      redirect_to orders_comfirm_path
    else
      render :new
    end
  end

  def comfirm
    @customer = current_customer
    @order = Order.new(order_params)
    if params[:postal_address] == Order.postal_addresses_i18n[:customer_add] # 自身の住所
      @order.postal_code = current_customer.postal_code
      @order.postal_address = current_customer.postal_address
      @order.postal_name = current_customer.first_name + current_customer.last_name
    
    elsif params[:postal_address] == Order.postal_addresses_i18n[:register_add] #登録済みの住所
      @address = PostalAddress.find(params[:order][:postal_address_id])
      @order.postal_code = @address.postal_code
      @order.postal_address = @address.postal_address
      @order.postal_name = @address.postal_name
    
    elsif params[:postal_address] == Order.postal_addresses_i18n[:new_add] #新しい住所
      @order.postal_code = params[:postal_address][:postal_code]
      @order.postal_address = params[:postal_address][:postal_address]
      @order.postal_name = params[:postal_address][:postal_name]
    end
    
    @order.save
    redirect_to orders_complete_path
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
end
