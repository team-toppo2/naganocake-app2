class Customer::CustomersController < ApplicationController
  def edit
    @customer = Customer.find(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def update
     @customer = Customer.find(paramas[:id])
    if @customer.update(product_params)
      redirect_to customer_path(@cutomer)
    else
      render edit
    end
  end

  def unsubscribe
  end

  def withdraw
  end
end
