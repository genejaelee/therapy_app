class RenameUserTable < ActiveRecord::Migration
  def change
    rename_table :clients, :clients
  end
end
