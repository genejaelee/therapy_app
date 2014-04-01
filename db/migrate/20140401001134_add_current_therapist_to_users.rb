class AddCurrentTherapistToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_therapist, :string
  end
end
