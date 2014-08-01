class AddTimeZoneToClients < ActiveRecord::Migration
  def change
    add_column :clients, :time_zone, :string
  end
end
