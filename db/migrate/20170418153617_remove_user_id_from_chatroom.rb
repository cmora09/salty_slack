class RemoveUserIdFromChatroom < ActiveRecord::Migration[5.0]
  def change
  	remove_column :chatrooms, :user_id
  end
end
