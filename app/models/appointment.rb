class Appointment < ActiveRecord::Base
  validates :date, :presence => true
  validates :hour, :presence => true, :uniqueness => {:scope => :date}
end
