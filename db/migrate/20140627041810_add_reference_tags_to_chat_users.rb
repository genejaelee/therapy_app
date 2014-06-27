class AddReferenceTagsToChatUsers < ActiveRecord::Migration
  def change
    add_column :chat_users, :client_id, :integer
    add_column :chat_users, :therapist_id, :integer
  end
end
