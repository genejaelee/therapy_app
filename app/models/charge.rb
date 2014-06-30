class Charge < ActiveRecord::Base
  belongs_to :therapists
  belongs_to :clients
  belongs_to :event
end
