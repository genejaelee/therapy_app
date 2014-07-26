class AddLandingTagToEmailBox < ActiveRecord::Migration
  def change
    add_column :email_boxes, :landing, :boolean
  end
end
