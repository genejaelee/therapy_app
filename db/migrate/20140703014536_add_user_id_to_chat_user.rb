class AddUserIdToChatUser < ActiveRecord::Migration
  def change
    add_column :chat_users, :user_id, :integer
  end
end
