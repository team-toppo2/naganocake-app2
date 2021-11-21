class Admin::CustomersController < ApplicationController
  def index
    @customers = customer.all
  end

  def create
  end

  def edit
  end

  def update
  end

end
