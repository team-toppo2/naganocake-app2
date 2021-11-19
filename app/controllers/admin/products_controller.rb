class Admin::ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).reverse_order
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @genres =  Genre.all
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
    @genres =  Genre.all
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product)
    else
      render edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:image,:name,:discription,:genre_id,:price,:is_active)
  end

  def set_genres
    @genres =  Genre.all
  end

end
