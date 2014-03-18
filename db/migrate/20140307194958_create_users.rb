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
      
      t.string :encrypted_description
      t.string :encrypted_description_salt
      t.string :encrypted_description_iv
      t.string :gender_pref

      t.timestamps
    end
  end
end
