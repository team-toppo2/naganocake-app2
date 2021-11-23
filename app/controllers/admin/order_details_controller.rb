class Admin::OrderDetailsController < ApplicationController

  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(order_detail_params)
    @order = @order_product.order
    @order_products = @order.order_products
    if @order_product.product_status == "producing"
      order = @order_product.order
      order.order_status = "producing"
      order.save
      redirect_to admin_order_path(@order_product.order)
    elsif @order_products.where(product_status: "finish").count == @order_products.count
      order = @order_product.order
      order.order_status = "preparing"
      order.save
      redirect_to admin_order_path(@order_product.order)
    else
      redirect_to admin_order_path(@order_product.order)
    end
  end

  private
  def order_detail_params
    params.require(:order_product).permit(:product_status) #permit(:order_status,ordered_items_attributes:[:id, :product_status])??
  end

end