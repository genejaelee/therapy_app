class RemoveEncryptedDescriptionFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :encrypted_description, :string
    remove_column :clients, :encrypted_description_salt, :string
    remove_column :clients, :encrypted_description_iv, :string
  end
end
