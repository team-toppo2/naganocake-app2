class Customer::CustomersController < ApplicationController
  def show
    @customers = Customer.all
    @customer = current_customer
    @new_customer = Customer.new
  end

  def edit
    @customer = current_customer
    unless current_customer.id == @customer.id
      redirect_to customer_path(current_customer)
    end
  end


  def update
     @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      @customers = Customer.all
      render edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path

  end
end

private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_jp, :first_name_jp, :postal_code, :address, :telephone_number)
  end
