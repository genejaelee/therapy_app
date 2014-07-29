class AddYearsToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :years, :integer
  end
end
