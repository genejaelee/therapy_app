class AddCurrentTherapistNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_therapist_name, :string
  end
end
