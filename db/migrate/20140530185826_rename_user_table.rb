class RenameUserTable < ActiveRecord::Migration
  def change
    rename_table :users, :clients
  end
end
