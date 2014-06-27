class RemoveDeviseAttributesFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :email, :string
    remove_column :clients, :encrypted_password, :string
    remove_column :clients, :reset_password_token, :string
    remove_column :clients, :reset_password_sent_at, :datetime
    remove_column :clients, :remember_created_at, :datetime
    remove_column :clients, :sign_in_count, :integer
    remove_column :clients, :current_sign_in_at, :datetime
    remove_column :clients, :last_sign_in_at, :datetime
    remove_column :clients, :current_sign_in_ip, :string
    remove_column :clients, :last_sign_in_ip, :string
    remove_column :clients, :time_zone, :string
  end
end