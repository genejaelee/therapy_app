class AddChatIdToChatUsers < ActiveRecord::Migration
  def change
    add_column :chat_users, :chat_id, :integer
    
    add_index :chat_users, :chat_id
  end
end
