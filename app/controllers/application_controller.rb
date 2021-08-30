class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def current_customer
    current_customer = Customer.find_by(id: session[:customer_id])
    current_customer = Customer.create unless current_customer
    session[:customer_id] = current_customer.id
    current_customer
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end


end
