class RemoveStripeAttributesToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :stripe_token, :string
    remove_column :users, :stripe_customer_id, :string
  end
end
