class Event < ActiveRecord::Base
  belongs_to :therapist
  belongs_to :client
  has_one :chat
  has_one :charge
  
  #validates_presence_of :start_date, :start_time, :time_zone
  #validates :start_time, :uniqueness => { :scope => :start_date }
  
  def format_suggested_times_with_timezone(times_hash, time_zone)
    datetimes = []
    puts "times hash is #{times_hash}"
    datetime1 = "#{self.format_date_to_ISO(times_hash[:suggested_date1])} #{times_hash[:suggested_time1]}"
    datetime2 = "#{self.format_date_to_ISO(times_hash[:suggested_date2])} #{times_hash[:suggested_time2]}"
    #datetime3 = "#{self.format_date_to_ISO(times_hash[:suggested_date3])} #{times_hash[:suggested_time3]}"
    datetimes.push(datetime1, datetime2)
    
    formatted_datetimes = parse_datetimes_with_timezone(datetimes, time_zone)
    return formatted_datetimes
  end
  
  def parse_datetimes_with_timezone(datetimes, time_zone)
    formatted_datetimes = []
    datetimes.each do |datetime|
      Time.zone = time_zone
      @formatted_datetime = "#{Time.zone.parse(datetime).in_time_zone(time_zone).strftime('%F')} #{Time.zone.parse(datetime).in_time_zone(time_zone).strftime('%R')}"
      formatted_datetimes.push(@formatted_datetime)
    end
    puts "#{formatted_datetimes}"
    return formatted_datetimes
  end
  
  def format_date_to_ISO(date)
    if (date.match(/\d\d\/\d\d\/\d\d\d\d/) || date.match(/\d\d\/\d\d\/\d\d/))
      @split_date = date.split('/')
      year = @split_date[2]
      day = @split_date[1]
      month = @split_date[0]
      @formatted_date = "#{year}-#{month}-#{day}"
    else
      @formatted_date = date
    end
    return @formatted_date
  end
end