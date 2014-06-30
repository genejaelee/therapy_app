class AddAttributesToCharge < ActiveRecord::Migration
  def change
    add_column :charges, :stripe_token, :string
    add_column :charges, :event_id, :integer
    add_column :charges, :client_id, :integer
    add_column :charges, :therapist_id, :integer
    add_column :charges, :amount, :integer
    add_column :charges, :stripe_customer_id, :integer
  end
end
