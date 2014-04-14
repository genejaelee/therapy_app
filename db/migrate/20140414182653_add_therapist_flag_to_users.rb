class AddTherapistFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :flag_therapist, :boolean
  end
end
