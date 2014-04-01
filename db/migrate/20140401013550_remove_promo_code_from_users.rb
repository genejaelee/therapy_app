class RemovePromoCodeFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :promo_code, :string
  end
end
