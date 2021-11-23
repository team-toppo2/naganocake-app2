class Admin::OrdersController < ApplicationController
    
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
  	redirect_to admin_order_path(@order)
  end
  
  private
  def order_params
    params.require(:order).permit(:order_status) #permit(:order_status,ordered_items_attributes:[:id, :product_status])??
  end
end
