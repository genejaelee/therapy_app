class AddEmailToCharge < ActiveRecord::Migration
  def change
    add_column :charges, :stripe_email, :string
  end
end
