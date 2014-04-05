class AddTitleToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :title, :string
  end
end
