class Event < ActiveRecord::Base
  belongs_to :therapist
  belongs_to :user
  
  validates_presence_of :start_date, :start_time
  
  scope :between, lambda {|start_time, end_time|
    { :conditions => ["? < starts_at < ?", Event.format_date(start_time), Event.format_date(end_time)] }
  }
  
  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end
end
