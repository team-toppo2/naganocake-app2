class Customer::AddressesController < ApplicationController
  def index
    @postal_addresses = current_customer.postal_addresses
    @postal_address = PostalAddress.new
  end

  def create
    @postal_address = PostalAddress.new(postal_address_params)
    @postal_address.customer_id = current_customer.id
    @postal_addresses =current_customer.postal_address
    if @postal_address.save
      redirect_to addresses_path
    else
      @postal_addresses =current_customer.postal_address
      render index
    end
  end

  def edit
    @postal_address = PostalAddress.find(params[:id])
  end

  def update
  end

  def destroy
    @postal_address = PostalAddress.find(params[:id])
  end

end
