class AddApproachSubsectionsToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :approach_sub1, :text
    add_column :therapists, :approach_sub2, :text
  end
end
