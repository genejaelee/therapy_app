class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      
      t.string :user
      t.string :email
      t.string :token

      t.timestamps
    end
  end
end
