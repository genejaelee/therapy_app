class CreateVideoGalleries < ActiveRecord::Migration
  def change
    create_table :video_galleries do |t|

      t.timestamps
    end
  end
end
