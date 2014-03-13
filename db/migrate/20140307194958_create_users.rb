class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :encrypted_name
      t.string :encrypted_name_salt
      t.string :encrypted_name_iv
      t.string :encrypted_email
      t.string :encrypted_email_salt
      t.string :encrypted_email_iv
      t.string :encrypted_zipcode
      t.string :encrypted_zipcode_salt
      t.string :encrypted_zipcode_iv

      t.timestamps
    end
  end
end
