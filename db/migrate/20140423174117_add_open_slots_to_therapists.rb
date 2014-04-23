class AddOpenSlotsToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :open_slots, :string
  end
end
