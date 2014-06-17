class AddClientIdToTherapist < ActiveRecord::Migration
  def change
    add_column :therapists, :client_id, :integer
  end
end
