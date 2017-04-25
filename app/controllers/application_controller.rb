class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  
  helper_method :member_of_group, :verified_log_in, :redirect_with_flash

  def member_of_group
    !!@chatroom.memberships.find_by(user_id: current_user.id)
  end

  def redirect_with_flash
    flash[:notice] = "You are not a member of that room"
    redirect_to root_path
  end

  def verify_logged_in
    unless logged_in?
   	  flash[:notice] = "You must be logged in to view that page"
      redirect_to root_path
    end
  end

  protected
  
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:username,:first_name,:last_name,:remember_me])
  	devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:password])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:email,:username,:password,:first_name,:last_name,:remember_me])
  end

end
