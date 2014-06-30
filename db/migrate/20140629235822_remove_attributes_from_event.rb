class RemoveAttributesFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :time_zone, :string
    remove_column :events, :start, :string
    remove_column :events, :end, :string
    remove_column :events, :start_time, :string
    remove_column :events, :start_date, :string
  end
end
