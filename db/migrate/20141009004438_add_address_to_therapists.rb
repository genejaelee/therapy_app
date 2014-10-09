class AddAddressToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :address, :string
  end
end
