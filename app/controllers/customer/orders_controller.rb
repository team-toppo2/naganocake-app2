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
      @order.postal_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1" #登録済みの住所
      @address = PostalAddress.find(params[:order][:postal_address_id])
      @order.postal_code = @address.postal_code
      @order.postal_address = @address.postal_address
      @order.postal_name = @address.postal_name
    elsif params[:order][:select_address] == "2" #新しい住所
      @order.postal_code = params[:order][:postal_code]
      @order.postal_address = params[:order][:postal_address]
      @order.postal_name = params[:order][:postal_name]
    end
    @order.order_status = "waiting"
    @order.shipping_cost = "800"
    @cart_items = current_customer.cart_items.all
    #請求額の計算
    @finalprice = @order.shipping_cost #.to_i
      @cart_items.each do |cart_item|
        @subtotal = cart_item.product.add_tax_price * cart_item.product_amount
        @finalprice += @subtotal #.to_i
      end
    @order.final_price = @finalprice #.to_i
  end

  def create
    @customer = current_customer
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    @cart_items = current_customer.cart_items.all #カート内の情報を全てOrderProductへ保存
      @cart_items.each do |cart_item|
        @order_products = @order.order_products.new
        @order_products.order_id = @order.id #不要？
        @order_products.product_id = cart_item.product_id
        @order_products.amount = cart_item.product_amount
        @order_products.save
      end
    current_customer.cart_items.destroy_all #カート内商品を全削除
    redirect_to complete_orders_path
  end

  def complete
    @customer = current_customer
  end

  def index
    @customer = current_customer
    @orders = Order.all
  end

  def show
    @customer = current_customer
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_address, :postal_code, :postal_name, :postal_address_id, :select_postal_address_id, :final_price, :shipping_cost, :order_status, :user_id)
  end

  def address_params
    params.require(:order).permit(:postal_address, :postal_code, :postal_name)
  end
end
