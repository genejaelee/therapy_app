class AddSuggestedTimesToEvent < ActiveRecord::Migration
  def change
    add_column :events, :suggested_times, :string, array: true, default: []
  end
end
