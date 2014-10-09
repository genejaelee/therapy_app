class AddGifSubtitlesToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :intro_gif_subtitles, :text
  end
end
