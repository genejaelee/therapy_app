class ChangeDescriptionTypeInClients < ActiveRecord::Migration
  def change
    change_column :clients, :encrypted_description, :string
    change_column :clients, :encrypted_description_salt, :string
    change_column :clients, :encrypted_description_iv, :string
  end
end
