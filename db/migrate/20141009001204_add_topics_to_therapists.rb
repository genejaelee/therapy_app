class AddTopicsToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :topics, :string, array: true, default: []
  end
end
