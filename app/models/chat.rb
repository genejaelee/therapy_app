class Chat < ActiveRecord::Base
  belongs_to :therapist
  belongs_to :client
  belongs_to :event
end
