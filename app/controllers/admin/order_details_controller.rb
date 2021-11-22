class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:order_id][:order_product_id]) #あってる？？？
    @order.update(order_detail_params)
  	redirect_to admin_order_path(@order)
  end

  private
  def order_detail_params
    params.require(:order_product).permit(:product_status) #permit(:order_status,ordered_items_attributes:[:id, :product_status])??
  end

end