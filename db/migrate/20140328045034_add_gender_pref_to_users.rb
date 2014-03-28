class AddGenderPrefToUsers < ActiveRecord::Migration
  def change
    add_column :users, :encrypted_gender_pref, :string
    add_column :users, :encrypted_gender_pref_salt, :string
    add_column :users, :encrypted_gender_pref_iv, :string
  end
end
