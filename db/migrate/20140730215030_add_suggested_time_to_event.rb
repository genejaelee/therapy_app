class AddSuggestedTimeToEvent < ActiveRecord::Migration
  def change
    add_column :events, :suggested_time, :string
  end
end
