class Therapist < ActiveRecord::Base
  has_many :events
  has_many :users, through: :events
  before_save :create_permalink, :convert_slots_to_UTC_0_and_format
  
  retina!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :should_validate_attributes
         
  has_attached_file :avatar, 
  :styles => { :thumb => "100x100#", :small => "200x200#", :medium => "300x300#", :large => "500>" },
  :default_url => "/images/:style/missing.png",
  :retina => { :quality => 70 },
  :s3_protocol => 'https'
  
  validates_attachment_size :avatar, :less_than => 3.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates_uniqueness_of :permalink, :message => ": Your custom URL taken", :on => :update
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
  
  def clear_slots
    self.open_slots.clear
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
  
  def create_permalink
    if self.permalink.nil? && !self.first_name.nil? && !self.last_name.nil?
      self.permalink = self.first_name.downcase + self.last_name.downcase + self.id
    elsif self.permalink.nil?
      self.permalink = self.email.split("@")[0].to_s + rand(1000..9999).to_s
    else
    end
  end
end
