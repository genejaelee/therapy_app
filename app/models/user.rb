class User < ActiveRecord::Base
  include Encryption
  has_many :events
  has_many :therapists, through: :events
  
  attr_encrypted :name, :email, :zipcode, :description, :gender, :age, :gender_pref, :insurance, :key => :encryption_key
  attr_accessor :should_validate_age, :paid, :add_responses
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  #validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  #validates :zipcode, presence: true, length: { minimum: 5 }, :with => :zipcode_validator
  #validates_format_of :zipcode, :with => /^\d{5}(?:[-\s]\d{4})?$/, multiline: true, :message => "should be in the form 12345 or 12345-1234"
  #validates :description, presence: true, :on => :update
  
  #validates :age, presence: true, numericality: true, :on => :update
  #validates :phone, presence: true, :on => :update
  
  def zipcode_validator
    if ((ZipCodeInfo.instance.scf_city_for self.zipcode) == false)
      errors.add(:zipcode, "error. Sorry, we're only in the USA right now.")
      return false
    else
      return true
    end
  end
  
  def apply_promo
    if self.promo_code == "WHISPER033"
      self.price = "0"
    elsif self.promo_code == "WHISPER016"
      self.price = "200"
    else
      self.price = "400"
    end
  end
  
  def save_user_card
    customer = Stripe::Customer.create(
      :card => self.stripe_token
    )
    
    cu = Stripe::Customer.retrieve(customer.id)
    cu.save
  end
  
end   

class User
  def self.list
    puts "All attributes of users"
    self.all.each do |user|
      puts "#{user.id} / #{user.name} / #{user.gender} / #{user.gender_pref} / #{user.age} / #{user.email} / #{user.zipcode} / #{user.insurance} / #{user.description} / #{user.created_at} \n \n"
    end
  end
  
  def self.create_sample
    @sample = User.create(name:'sample name', email:'genejaelee@gmail.com', gender:'Male', age:'23', description:'sample description', zipcode:'60615')
  end
  
  def self.create_with(attributes)
    a = attributes.split("/")
    User.create(id:a[0].strip, name:a[1].strip, gender:a[2].strip, gender_pref:a[3].strip, age:a[4].strip, email:a[5].strip, zipcode:a[6].strip, insurance:a[7].strip, description:a[8].strip)
  end
  
  def self.print_responses(id)
    puts self.name
    puts self.find_by(id:id).responses.join("\n \n")
  end
  
  def add_responses(a)
    b = [a]
    response_array = b.map { |f| f.gsub("\n", " ") }
    if self.responses.nil?
      self.responses = response_array
    elsif self.responses.present?
      self.responses = self.responses + response_array
    end
    self.save
    puts (self.responses)
  end
end
