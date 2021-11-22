class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?



  # def create
  #   @customer = Customer.new(customer_params)
  #   @customer.customer_id = current_customer.id
  #   if @customer.save
  #     redirect_to customer_path(@customer)
  #   else
  #     @customers = Customer.all
  #     render 'index'
  #   end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_jp, :first_name_jp, :postal_code, :address, :telephone_number, :encrypted_password])
  end
end