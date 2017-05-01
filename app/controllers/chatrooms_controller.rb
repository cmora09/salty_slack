class ChatroomsController < ApplicationController

  def new
    @chatroom = Chatroom.new
    @membership = Membership.new
  end

  def create
    @chatroom = current_user.chatrooms.build(chatroom_params)
    if @chatroom.save 
      @chatroom.users << current_user
      redirect_to root_path
    else
      flash[:error] = "Error adding chatroom. Please try again."
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    if @chatroom.name == "general"
      @users = User.all
      @messages = @chatroom.messages
      @message = Message.new
    else
      redirect_with_flash unless member_of_group
      @messages = @chatroom.messages
      @membership = Membership.new
      @memberships = @chatroom.memberships
      @message = Message.new
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
      params.require(:chatroom).permit(:name)
    end

end
