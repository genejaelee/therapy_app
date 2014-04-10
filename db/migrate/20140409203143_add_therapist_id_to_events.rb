class AddTherapistIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :therapist_id, :integer
  end
end
