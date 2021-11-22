class Customer::CartItemsController < ApplicationController
  
  def index
    @cart_items = current_customer.cart_items.all
  end
  
  def create
  # product/showの詳細で登録した商品情報を受け取る
    @cart_items = current_customer.cart_items.all
    @cart_item = current_customer.cart_items.new(cart_item_params)
    #ログイン中カスタマーのカートアイテムを全て取り出す
    @cart_items.each do |cart_item|
    #カートの中に入れた商品情報が既にカートにある場合は
     if cart_item.product_id == @cart_item.product_id
    #既にカートにあるamountと現在追加したamountを足して更新する
       new_product_amount = cart_item.product_amount + @cart_item.product_amount
       cart_item.update_attribute(:product_amount, new_product_amount)
       @cart_item.delete
     end
    end
    @cart_item.save
    redirect_to cart_items_path
  end
  
  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.update
    redirect_to cart_items_path
  end
  
  def destroy
    cart_item = current_customer.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

 def cart_items_all_destory
   cart_items = current_customer.cart_items.all
   cart_items.destroy_all
   render 'index'
 end
 
 def cart_item_params
    params.require(:cart_item).permit(:customer_id, :product_id, :product_amount)
 end
 
end
