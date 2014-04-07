class AddAttrToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :city, :string
    add_column :therapists, :zipcode, :string
    add_column :therapists, :phone, :string
    add_column :therapists, :bio, :text
  end
end
