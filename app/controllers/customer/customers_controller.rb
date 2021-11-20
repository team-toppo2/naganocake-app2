class Customer::CustomersController < ApplicationController
  def show
    @customers = Customer.all
    @customer = Customer.find(params[:id])
    @new_customer = Customer.new
  end

  def edit
    @customer = Customer.find(params[:id])
    unless current_customer.id == @customer.id
      redirect_to customer_path(current_customer)
    end
  end


  def update
     @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      @customers = Customer.all
      render edit
    end
  end

  def unsubscribe
    @customers = Customer.all
    @customer = Customer.find(params[:id])
  end

  def withdraw
  end
end

private
  def customer_params
    params.require(:customer).permit(:"氏名", :"フリガナ", :"郵便番号", :"住所", :"電話番号", :"メールアドレス")
  end
