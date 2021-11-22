class Customer::AddressesController < ApplicationController

  def index
    @postal_addresses = current_customer.postal_addresses
    @postal_address = PostalAddress.new
  end

  def create
    @postal_address = PostalAddress.new(postal_address_params)
    @postal_address.customer_id = current_customer.id
    @postal_addresses = current_customer.postal_addresses
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
    @postal_address = PostalAddress.find(params[:id])
    if @postal_address.update(postal_address_params)
      redirect_to addresses_path
    else
      render edit
    end
  end

  def destroy
    @postal_address = PostalAddress.find(params[:id])
    @postal_address.destroy
    @postal_addresses =current_customer.postal_addresses
    redirect_to addresses_path
  end

  private

  def postal_address_params
  params.require(:postal_address).permit(:postal_code, :postal_address, :postal_name)
  end

end
