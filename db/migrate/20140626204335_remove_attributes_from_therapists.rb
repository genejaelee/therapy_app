class RemoveAttributesFromTherapists < ActiveRecord::Migration
  def change
    remove_column :therapists, :email, :string
    remove_column :therapists, :encrypted_password, :string
    remove_column :therapists, :reset_password_token, :string
    remove_column :therapists, :reset_password_sent_at, :datetime
    remove_column :therapists, :remember_created_at, :datetime
    remove_column :therapists, :sign_in_count, :integer
    remove_column :therapists, :current_sign_in_at, :datetime
    remove_column :therapists, :last_sign_in_at, :datetime
    remove_column :therapists, :current_sign_in_ip, :string
    remove_column :therapists, :last_sign_in_ip, :string
    remove_column :therapists, :time_zone, :string
  end
end
