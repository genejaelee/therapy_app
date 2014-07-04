class AddTimerTimeToChats < ActiveRecord::Migration
  def change
    add_column :chats, :timer_time, :string
  end
end
