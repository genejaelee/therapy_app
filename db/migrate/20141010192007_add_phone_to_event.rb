class AddPhoneToEvent < ActiveRecord::Migration
  def change
    add_column :events, :phone, :string
  end
end
