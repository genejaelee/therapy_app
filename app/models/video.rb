class Video < ActiveRecord::Base
  belongs_to :video_gallery
  
  has_attached_file :video
  
end
