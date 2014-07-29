class ChangeTherapistsIssuesToArrayTrue < ActiveRecord::Migration
  def change
    remove_column :therapists, :issues, :text
    add_column :therapists, :issues, :string, array: true, default: '{}'
  end
end
