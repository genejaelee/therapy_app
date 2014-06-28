class AddEventIdToChats < ActiveRecord::Migration
  def change
    add_column :chats, :event_id, :integer
  end
end
