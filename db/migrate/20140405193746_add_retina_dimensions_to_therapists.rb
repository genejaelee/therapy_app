class AddRetinaDimensionsToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :retina_dimensions, :text
  end
end
