class Chatroom < ApplicationRecord
  
  has_many :memberships
  
  has_many :messages, dependent: :destroy
  has_many :users, through: :memberships 

  validates :name, presence: true, length: {minimum: 3, maximum: 20}, uniqueness: true
  
end
