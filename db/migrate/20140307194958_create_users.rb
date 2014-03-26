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
      
      t.text :encrypted_description
      t.text :encrypted_description_salt
      t.text :encrypted_description_iv
      
      t.string :encrypted_gender
      t.string :encrypted_gender_salt
      t.string :encrypted_gender_iv
      
      t.string :encrypted_age
      t.string :encrypted_age_salt
      t.string :encrypted_age_iv
      
      t.string :encrypted_insurance
      t.string :encrypted_insurance_salt
      t.string :encrypted_insurance_iv
      
      t.string :price
      t.string :promo_code
      t.string :responses, :array => true

      t.timestamps
    end
  end
end
