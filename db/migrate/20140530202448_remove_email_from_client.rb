class RemoveEmailFromClient < ActiveRecord::Migration
  def change
    remove_column :clients, :encrypted_email
    remove_column :clients, :encrypted_email_salt
    remove_column :clients, :encrypted_email_iv
  end
end
