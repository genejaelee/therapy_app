class AddPermalinkToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :permalink, :string
  end
end
