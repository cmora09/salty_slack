class OnlinestatusChannel < ApplicationCable::Channel

  def subscribed
    
    member = Membership.where(user_id: current_user.id, chatroom_id: params[:chatroom]).first
    return unless member
    member.is_online
    stream_from "appearance_#{params[:chatroom]}"
  
  end
 
  def unsubscribed

    member = Membership.where(user_id: current_user.id, chatroom_id: params[:chatroom]).first
    return unless member
    member.is_offline

  end
  
end
