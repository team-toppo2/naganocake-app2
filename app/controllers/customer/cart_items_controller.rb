class Customer::CartItemsController < ApplicationController
  
  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, product| sum + product.subtotal }
  end
  
  def create
  # product/showの詳細で登録した商品情報を受け取る
    @cart_item = current_customer.cart_items.build(cart_item_params)
    #ログイン中カスタマーのカートアイテムを全て取り出す
    @cart_items = current_user.cart_items.all
    @cart_items.each do |cart_item|
    #カートの中に入れた商品情報が既にカートにある場合は
     if cart_item.product_id == @cart_item.item_id
    #既にカートにあるamountと現在追加したamountを足して更新する
       new_amount = cart_item.amount + @cart_item.amount
       cart_item.update_attribute(:amount, new_amount)
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
   cart_items = CartItem.all
   cart_items.destroy_all
   render 'index'
 end
 
end
