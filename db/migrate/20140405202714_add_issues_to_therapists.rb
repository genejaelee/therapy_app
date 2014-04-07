class AddIssuesToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :issues, :text
  end
end
