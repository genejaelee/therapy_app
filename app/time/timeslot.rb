class TimeSlot
  
  attr_reader :therapist
  
  def initialize(therapist)
    @therapist = therapist
  end

  def convert_slots_to_UTC_0_and_format
    if self.open_slots.empty?
    else
      @therapist_time_zone = self.time_zone
      @neutral_array = []
      self.open_slots.each do |slot|
        parsed_slot = Time.zone.parse(slot)
        if parsed_slot.time_zone.name == "UTC"
          @neutral_array.push(parsed_slot)
        else
          @neutral_slot = slot.in_time_zone("UTC")
          @neutral_array.push(@neutral_slot)
        end
      end
      self.open_slots = @neutral_array
      puts "neutral array is #{@neutral_array}"
    end
  end
  
  def add_open_slots(time)
    blank_array = []
    current_array = self.open_slots
    @therapist_time_zone = self.time_zone
    if !current_array.nil?
      Time.zone = @therapist_time_zone
      current_array.push(Time.zone.parse(time).in_time_zone(@therapist_time_zone).to_s)
      puts "put in #{Time.zone.parse(time).in_time_zone(@therapist_time_zone)}"
    end
    puts current_array
    self.open_slots = current_array
    self.save
  end
  
  def remove_open_slots(time)
    current_array = self.open_slots
    current_array.delete(time)
    self.open_slots = current_array
    self.save
  end
  
  def find_slots_by_date(date)
    current_array = self.open_slots
    @scoped_array = []
    current_array.each do |slot|
      parsed_slot_date = Time.zone.parse(slot).strftime('%F')
      if parsed_slot_date == date
        @scoped_array.push(Time.zone.parse(slot))
      end
    end
    return @scoped_array
  end
  
end