class Chat < ActiveRecord::Base
  belongs_to :therapist
  belongs_to :client
end
