class CreateEmailBoxes < ActiveRecord::Migration
  def change
    create_table :email_boxes do |t|
      t.string :email

      t.timestamps
    end
  end
end
