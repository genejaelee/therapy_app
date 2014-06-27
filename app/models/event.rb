class Event < ActiveRecord::Base
  belongs_to :therapist
  belongs_to :client
  before_validation :convert_to_UTC_0_and_format
  
  #validates_presence_of :start_date, :start_time, :time_zone
  #validates :start_time, :uniqueness => { :scope => :start_date }
  
  #format to format "2014-04-23 15:00:00 -0300"
  def convert_to_UTC_0_and_format
    if self.start_time.blank?
      self.start_time = nil
    elsif self.time_zone.blank?
    else
      @start_time = self.start_time
      @client_time_zone = self.time_zone
      puts self.time_zone
      @start_date = self.start_date
      puts "#{@start_time} #{@time_zone}"
      
      @formatted_date = self.class.format_date_to_ISO(@start_date)
      @formatted_date_time = "#{@formatted_date} #{@start_time}"
      Time.zone = @client_time_zone
      @client_date_time = Time.zone.parse("#{@formatted_date_time}").in_time_zone(@client_time_zone)
      @neutral_date_time = @client_date_time.in_time_zone('UTC')
      puts "neutral date time is #{@neutral_date_time}"
      #assign new values
      self.start_time = @neutral_date_time.strftime('%R')
      self.start_date = @neutral_date_time.strftime('%F')
      self.time_zone = 'UTC'
    end
  end
  
  def self.format_date_time(events, client, therapist, selected_date)
    @client_timezone = client.time_zone
    @client_taken_time_array = []
    @therapist_open_slots = get_therapist_open_slots(therapist, selected_date)
    if @therapist_open_slots.empty?
      puts "No avaiable therapist slots"
    end
    #convert time to TimeWithZone with therapist timezone, then push to array with client timezone
    events.each do |event|
      @formatted_date = format_date_to_ISO(event.start_date)
      @formatted_date_time = "#{@formatted_date} #{event.start_time}"
      #convert from UTC to current client timezone
      Time.zone = 'UTC'
      @client_date_time = Time.zone.parse("#{@formatted_date_time}").in_time_zone(@client_timezone)
      puts "client chose date and time #{@client_date_time}"
      @client_time = "#{@client_date_time.strftime('%R')}"
      @client_date = "#{@client_date_time.strftime('%m/%d/%Y')}"
      #after timezone convert if selected date matches appointment date
      if @client_date == selected_date
        puts "client date is equal to selected date!"
        @client_taken_time_array.push(@client_time.to_s)
      else 
        puts "client chose no dates equal to selected"
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
    
    puts "about to put therapist slots in, this is the array #{@therapist_open_slots}"
    @slots_to_erase = []
    @disabled_time_array.each_with_index do |time, index|
      puts "now checking #{time} at #{index}"
      @therapist_open_slots.each do |open_slot|
        parsed_time = Time.zone.parse("#{open_slot}").in_time_zone(@client_timezone)
        open_slot_time = parsed_time.strftime('%R')
        puts "parsed therapist open slot time is #{open_slot_time}"
        if open_slot_time == time
          @slots_to_erase.push(time)
          puts "will delete #{time} from disabled time array"
        end
      end
    end
    
    @slots_to_erase.each do |slot|
      @disabled_time_array.delete(slot)
    end
    puts @disabled_time_array
    @taken_time_array = @disabled_time_array.push(*@client_taken_time_array)
    return @taken_time_array
  end
  
  def self.get_therapist_open_slots(therapist, selected_date)
    @therapist_open_slots_array = therapist.open_slots
    @open_slots_by_date_array = []
    puts "therapist open slots are #{therapist.open_slots}"
    @therapist_open_slots_array.each do |slot|
      parsed_slot = Time.zone.parse(slot)
      if parsed_slot.strftime('%m/%d/%Y') == selected_date
        puts "therapist open slot date #{parsed_slot} is equal to selected date!"
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

class Event
  def convert_datetime_to_timezone(timezone)
    @datetime = "#{self.start_date} #{self.start_time}"
    Time.zone = self.time_zone
    @converted_datetime = Time.zone.parse(@datetime).in_time_zone(timezone)
    return @converted_datetime
  end
end
