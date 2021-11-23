class Admin::OrderDetailsController < ApplicationController

  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(order_detail_params)
    redirect_to admin_order_path(@order_product.order)
  end

  private
  def order_detail_params
    params.require(:order_product).permit(:product_status) #permit(:order_status,ordered_items_attributes:[:id, :product_status])??
  end

end