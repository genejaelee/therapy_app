class AddApproachSubsectionsTitlesToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :approach_sub1_title, :string
    add_column :therapists, :approach_sub2_title, :string
  end
end
