class HomeController < ApplicationController
  
  before_action :authenticate_user!
  
  def home
  	if user_signed_in?

  	else
  		redirect_to new_user_session_path
  	end
  end

  def get_chatrooms
    @chatrooms = Chatroom.all
    respond_to do |format|
      format.json {render json: @chatrooms}
    end
  end
end
