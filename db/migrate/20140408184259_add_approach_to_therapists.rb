class AddApproachToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :approach, :text
  end
end
