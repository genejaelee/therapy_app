class Event < ActiveRecord::Base
  belongs_to :therapist
  belongs_to :user
  before_validation :convert_to_UTC_0_and_format
  
  validates_presence_of :start_date, :start_time
  validates :start_time, :uniqueness => { :scope => :start_date }
  
  #format to format "2014-04-23 15:00:00 -0300"
  def convert_to_UTC_0_and_format
    if self.start_time.blank?
      self.start_time = nil
    else
      @start_time = self.start_time
      @user_time_zone = self.time_zone
      @start_date = self.start_date
      puts "#{@start_time} #{@time_zone}"
      
      @formatted_date = self.class.format_date_to_ISO(@start_date)
      @formatted_date_time = "#{@formatted_date} #{@start_time}"
      @user_date_time = Time.zone.parse("#{@formatted_date_time}").in_time_zone(@user_time_zone)
      @neutral_date_time = @user_date_time.in_time_zone('UTC')
      puts "neutral date time is #{@neutral_date_time}"
      #assign new values
      self.start_time = @neutral_date_time.strftime('%R')
      self.start_date = @neutral_date_time.strftime('%F')
      self.time_zone = 'UTC'
    end
  end
  
  def self.format_date_time(events, user, therapist, selected_date)
    @user_timezone = user.time_zone
    @user_taken_time_array = []
    @therapist_open_slots = get_therapist_open_slots(therapist, selected_date)
    #convert time to TimeWithZone with therapist timezone, then push to array with user timezone
    events.each do |event|
      @formatted_date = format_date_to_ISO(event.start_date)
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
        @user_taken_time_array.push(@user_time.to_s)
      end
    end
    
    @disabled_time_array = []
    for i in 1..23
      if i < 10
        @disabled_time_array.push("0#{i}:00")
      else
        @disabled_time_array.push("#{i}:00")
      end
    end
    
    @disabled_time_array.each do |time|
      @therapist_open_slots.each do |open_slot|
        parsed_time = Time.zone.parse("#{open_slot}")
        open_slot_time = parsed_time.strftime('%R')
        if open_slot_time == time
          @disabled_time_array.delete(time)
        end
      end
    end
    puts @disabled_time_array
    @taken_time_array = @disabled_time_array.push(*@user_taken_time_array)
    return @disabled_time_array
  end
  
  def self.get_therapist_open_slots(therapist, selected_date)
    @therapist_open_slots_array = therapist.open_slots
    @open_slots_by_date_array = []
    puts "therapist open slots are #{therapist.open_slots}"
    @therapist_open_slots_array.each do |slot|
      parsed_slot = Time.zone.parse(slot)
      if parsed_slot.strftime('%m/%d/%Y') == selected_date
        puts "therapist open slot date is equal to selected date!"
        @open_slots_by_date_array.push(slot)
      end
    end
    
    return @open_slots_by_date_array
  end
  
  def self.format_date_to_ISO(date)
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
