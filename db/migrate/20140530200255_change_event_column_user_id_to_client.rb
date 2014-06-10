class ChangeEventColumnUserIdToClient < ActiveRecord::Migration
  def change
    rename_column :events, :user_id, :client_id
  end
end
