class AddReferenceTagsToChats < ActiveRecord::Migration
  def change
    add_column :chats, :client_id, :integer
    add_column :chats, :therapist_id, :integer
  end
end
