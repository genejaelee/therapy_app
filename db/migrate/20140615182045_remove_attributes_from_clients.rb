class RemoveAttributesFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :encrypted_gender_pref, :string
    remove_column :clients, :encrypted_gender_pref_salt, :string
    remove_column :clients, :encrypted_gender_pref_iv, :string
    remove_column :clients, :price, :string
    remove_column :clients, :flag_therapist, :boolean
  end
end
