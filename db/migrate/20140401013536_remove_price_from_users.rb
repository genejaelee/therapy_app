class RemovePriceFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :price, :string
  end
end
