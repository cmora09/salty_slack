class MessagesController < ApplicationController
  def create
  	@message = current_user.messages.build(message_params)
  	if @message.save
  		ActionCable.server.broadcast 'chatroom_channel',
  		  body: @message.body,
  		  user: @message.user.username
  		  head :ok
  	end
  end

  private
  	def message_params
  		params.require(:message).permit(:body,:chatroom_id)
  	end
end
