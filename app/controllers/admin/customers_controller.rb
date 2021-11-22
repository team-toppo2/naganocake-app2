class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @customer = Customer.page(params[:page]).reverse_order
  end

  def show
    @customers = Customer.all
  end

  def edit
    @customers = Customer.all
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
      flash[:success] = "You have updated user successfully."
    else
    @customers = Customer.all
      render :edit
    end
  end

  def product_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_jp, :first_name_jp, :postal_code, :address, :telephone_number,:is_deleted)
  end


end
