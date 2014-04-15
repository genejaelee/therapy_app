class Therapist < ActiveRecord::Base
  has_many :events
  has_many :users, through: :events
  
  retina!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :should_validate_attributes
         
  has_attached_file :avatar, 
  :styles => { :thumb => "100x100#", :small => "200x200#", :medium => "300x300#", :large => "500>" },
  :default_url => "/images/:style/missing.png",
  :retina => { :quality => 70 }
  
  validates_attachment_size :avatar, :less_than => 3.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates_uniqueness_of :permalink, :message => ": Your custom URL taken", :on => :update
  validates_presence_of :first_name, :last_name, :city, :state, :degree, :on => :update
  validates :zipcode, presence: true, length: { minimum: 5 }, :with => :zipcode_validator, :on => :update
  
  before_save :create_permalink
  
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
    end
  end
end
