class ChatroomsController < ApplicationController
  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = current_user.chatrooms.build(chatroom_params)
    if @chatroom.save
      redirect_to root_path
    else
      flash[:error] = "Error adding chatroom. Please try again."
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def chatroom_params
      params.require(:chatroom).permit(:user_id,:name)
    end
end
