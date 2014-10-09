class VideoGallery < ActiveRecord::Base
  has_many :videos, :dependent => :destroy
end
