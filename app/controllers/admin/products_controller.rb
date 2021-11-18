class Admin::ProductsController < ApplicationController
  def show
    @product = Product.find(paramas[:id])
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
    @product = Product.find(paramas[:id])
  end

  def update
    @product = Product.find(paramas[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product)
    else
      render edit
    end
  end

  private
  def product_params
    paramas.require(:product).permit(:image,:name,:discription,:genre_id,:price,:is_active)
  end

end
