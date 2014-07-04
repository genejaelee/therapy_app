class AddTimerStateToChat < ActiveRecord::Migration
  def change
    add_column :chats, :timer_state, :string
  end
end
