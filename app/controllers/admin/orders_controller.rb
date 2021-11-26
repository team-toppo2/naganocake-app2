class Admin::OrdersController < ApplicationController
    
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_status == "paid"
      order_products = @order.order_products # step1.注文にひもづいている、すべての注文詳細をひっぱってくる
      order_products.each do |order_product|
        order_product.product_status = "waiting" # step2.注文詳細すべてのステータスを製作待ちにする。
        order_product.save
      end
    	redirect_to admin_order_path(@order)
    else
      redirect_to admin_order_path(@order)
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end