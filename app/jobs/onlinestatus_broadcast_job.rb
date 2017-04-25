class OnlinestatusBroadcastJob < ApplicationJob
  queue_as :default

  def perform(membership)
    ActionCable.server.broadcast "onlinestatus_#{membership.chatroom_id}", render_json(membership)
  end

  private

  def render_json(membership)
    ApplicationController.renderer.render(json: membership)
  end
end
