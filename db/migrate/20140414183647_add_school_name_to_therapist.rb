class AddSchoolNameToTherapist < ActiveRecord::Migration
  def change
    add_column :therapists, :school_name, :string
  end
end
