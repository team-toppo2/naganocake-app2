class Customer::HomesController < ApplicationController

  def top
    @customer = current_user
    @products = Product.all
  end

  def about
  end

 end