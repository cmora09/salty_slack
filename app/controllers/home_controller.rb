class HomeController < ApplicationController
  
  before_action :authenticate_user!
  
  def home
    @chatroom = Chatroom.where(name: "general").first
    @messages = @chatroom.messages
    @message = Message.new
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

  def get_users
    @users = User.all

    respond_to do |format|
      format.json {render json: @users}
    end

  end
end
