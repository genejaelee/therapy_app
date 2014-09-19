class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :insurance
      t.string :age_preference
      t.string :gender_preference
      t.string :email
      t.string :first_name
      t.text :comments

      t.timestamps
    end
  end
end
