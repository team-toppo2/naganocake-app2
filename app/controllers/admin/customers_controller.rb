class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @customer = Customer.page(params[:page]).reverse_order
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path
    else
      render edit
    end
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_jp, :first_name_jp, :postal_code, :address, :telephone_number, :is_deleted)
  end


end
