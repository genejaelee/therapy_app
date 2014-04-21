class AddTimeZoneToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :time_zone, :string
  end
end
