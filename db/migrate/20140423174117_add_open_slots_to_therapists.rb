class AddOpenSlotsToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :open_slots, :string, array: true, default: '{}'
  end
end
