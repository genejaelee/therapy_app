class Event < ActiveRecord::Base
  belongs_to :therapist
  belongs_to :user
  before_validation :convert_to_UTC_0
  
  validates_presence_of :start_date, :start_time
  validates :start_time, :uniqueness => { :scope => :start_date }
  
  def convert_to_UTC_0
    unless self.start_time.nil?
      @start_time = self.start_time
      @user_time_zone = self.time_zone
      @start_date = self.start_date
      puts "#{@start_time} #{@time_zone}"
      @split_date = @start_date.split('/')
      year = @split_date[2]
      day = @split_date[1]
      month = @split_date[0]
      @formatted_date = "#{year}-#{month}-#{day}"
      @formatted_date_time = "#{@formatted_date} #{@start_time}"
      @user_date_time = Time.zone.parse("#{@formatted_date_time}").in_time_zone(@user_time_zone)
      @neutral_date_time = @user_date_time.in_time_zone('UTC')
      puts "neutral date time is #{@neutral_date_time}"
      #assign new values
      self.start_time = @neutral_date_time.strftime('%R')
      self.start_date = @neutral_date_time.strftime('%m/%d/%Y')
      self.time_zone = 'UTC'
    end
  end
  
  def self.format_date_time(events, user, therapist, selected_date)
    @user_timezone = user.time_zone
    @user_date_time_array = []
    #convert time to TimeWithZone with therapist timezone, then push to array with user timezone
    events.each do |event|
      @split_date = event.start_date.split('/')
      year = @split_date[2]
      day = @split_date[1]
      month = @split_date[0]
      @formatted_date = "#{year}-#{month}-#{day}"
      @formatted_date_time = "#{@formatted_date} #{event.start_time}"
      #convert from UTC to current user timezone
      Time.zone = 'UTC'
      @user_date_time = Time.zone.parse("#{@formatted_date_time}").in_time_zone(@user_timezone)
      puts @user_date_time
      @user_time = "#{@user_date_time.strftime('%R')}"
      @user_date = "#{@user_date_time.strftime('%m/%d/%Y')}"
      #after timezone convert if selected date matches appointment date
      if @user_date == selected_date
        puts "user date is equal to selected date!"
        @user_date_time_array.push(@user_time.to_s)
      end
    end
    return @user_date_time_array
  end
end
