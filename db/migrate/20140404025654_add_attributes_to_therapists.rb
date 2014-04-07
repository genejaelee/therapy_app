class AddAttributesToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :first_name, :string
    add_column :therapists, :last_name, :string
    add_column :therapists, :gender, :string
    add_column :therapists, :state, :string
    add_column :therapists, :license_number, :string
    add_column :therapists, :degree, :string
  end
end
