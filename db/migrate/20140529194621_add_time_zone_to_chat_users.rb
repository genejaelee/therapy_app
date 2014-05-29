class AddTimeZoneToChatUsers < ActiveRecord::Migration
  def change
    add_column :chat_users, :time_zone, :string
  end
end
