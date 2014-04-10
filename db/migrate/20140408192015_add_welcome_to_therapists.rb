class AddWelcomeToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :welcome, :text
  end
end
