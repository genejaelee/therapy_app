class Therapist < ActiveRecord::Base
  has_many :events
  has_many :chats
  has_many :clients, through: :events
  has_many :charges
  #before_save :create_permalink, :convert_slots_to_UTC_0_and_format
  
  has_one :user, as: :role, dependent: :destroy
  accepts_nested_attributes_for :user
  
  retina!

  attr_accessor :should_validate_attributes
         
  has_attached_file :avatar, 
  :styles => { :thumb => "100x100#", :small => "200x200#", :medium => "300x300#", :large => "500>" },
  :default_url => "/images/:style/missing.png",
  :retina => { :quality => 70 },
  :s3_protocol => 'https'
  
  validates_attachment_size :avatar, :less_than => 3.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
  validates_presence_of :first_name, :last_name, :city, :state, :degree, :on => :update
  validates :zipcode, presence: true, length: { minimum: 5 }, :with => :zipcode_validator, :on => :update
  
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
  
  def zipcode_validator
    if ((ZipCodeInfo.instance.scf_city_for self.zipcode) == false)
      errors.add(:zipcode, "error. Sorry, we're only in the USA right now.")
      return false
    else
      return true
    end
  end
  
  def to_param
    permalink
  end
  
  private
end
