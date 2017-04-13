class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  
  protected
  
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:username,:first_name,:last_name,:remember_me])
  	devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:password])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:email,:username,:password,:first_name,:last_name,:remember_me])
  end

end
