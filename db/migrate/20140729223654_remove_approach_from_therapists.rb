class RemoveApproachFromTherapists < ActiveRecord::Migration
  def change
    remove_column :therapists, :approach_sub1, :text
    remove_column :therapists, :approach_sub2, :text
    remove_column :therapists, :approach_sub1_title, :string
    remove_column :therapists, :approach_sub2_title, :string
    remove_column :therapists, :approach, :text
    remove_column :therapists, :welcome, :text
  end
end
