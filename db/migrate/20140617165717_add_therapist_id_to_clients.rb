class AddTherapistIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :therapist_id, :integer
  end
end
