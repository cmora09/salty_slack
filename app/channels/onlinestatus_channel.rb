class OnlinestatusChannel < ApplicationCable::Channel

  def subscribed
    stream_from "onlinestatus_channel"
    if current_user

      member = Membership.where(user_id: current_user.id).first
      ActionCable.server.broadcast "onlinestatus_channel", { user: member.id, online: true }

      member.online = true

      member.save!
    end

  end
 
  def unsubscribed

    if current_user

      member = Membership.where(user_id: current_user.id).first
      ActionCable.server.broadcast "onlinestatus_channel", { user: member.id, online: false }

      member.online = false

      member.save!      

    end
    # member = Membership.where(user_id: current_user.id, chatroom_id: params[:chatroom]).first
    # return unless member


  end
  
end
