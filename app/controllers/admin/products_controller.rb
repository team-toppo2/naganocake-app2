class Admin::ProductsController < ApplicationController
  def show
    @product = Product.find(paramas[])
  end

  def index
    @products = Product.page(params[:page]).reverse_order
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product)
    else
      render new
    end
  end

  def edit
  end

  def update
  end

  private
  def product_params
    paramas.require(:product).permit(:image,:name,:discription,:genre_id,:price,:is_active)
  end

end
