class Customer::HomesController < ApplicationController

  def top
    @customer = current_customer
    @products = Product.all
  end

  def about
    @customer = current_customer
  end

end