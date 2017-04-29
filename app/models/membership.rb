class Membership < ApplicationRecord

  belongs_to :user
  belongs_to :chatroom

  validates_presence_of :chatroom_id
  validates_presence_of :user_id
  validates_uniqueness_of :user_id, :scope => :chatroom_id

  # after_update_commit {AppearanceBroadcastJob.perform_later self}
  
  def is_online
    self.update_attributes(online: true)
  end

  def is_offline
    self.update_attributes(online: false)
  end

end
