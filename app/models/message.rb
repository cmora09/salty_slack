class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :body, presence: true, length: {minimum: 1, maximum: 450}
  validates_presence_of :user_id
  validates_presence_of :chatroom_id
end
