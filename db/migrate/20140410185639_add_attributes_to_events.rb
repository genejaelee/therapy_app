class AddAttributesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :start_time, :string
    add_column :events, :start_date, :string
  end
end
