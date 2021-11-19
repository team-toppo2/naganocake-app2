class Customer::HomesController < ApplicationController

  def top
    @customer = current_customer
    @products = Product.all
  end

  def about
  end

end