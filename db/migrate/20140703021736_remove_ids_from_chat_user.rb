class RemoveIdsFromChatUser < ActiveRecord::Migration
  def change
    remove_column :chat_users, :client_id, :integer
    remove_column :chat_users, :therapist_id, :integer
  end
end
