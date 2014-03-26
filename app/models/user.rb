class User < ActiveRecord::Base
  include Encryption
  
  attr_encrypted :name, :email, :zipcode, :description, :gender, :age, :insurance, :key => :encryption_key
  attr_accessor :should_validate_age, :stripe_token, :paid, :responses, :add_responses
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :zipcode, presence: true, length: { minimum: 5 }, :with => :zipcode_validator
  validates_format_of :zipcode, :with => /^\d{5}(?:[-\s]\d{4})?$/, multiline: true, :message => "should be in the form 12345 or 12345-1234"
  validates :description, presence: true, :on => :update
  
  validates :age, presence: true, numericality: true, :on => :finish, :if => :should_validate_age?
  
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
  
  def charge_user(price)
    customer = Stripe::Customer.create(
      :email => self.email,
      :card => self.stripe_token
    )
    
    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => price,
      :description => 'Rails Stripe customer',
      :currency => 'usd'
    )
  end
  
end   

class User
  def self.list
    puts "All attributes of users"
    self.all.each do |user|
      puts "#{user.id} / #{user.name} / #{user.gender} / #{user.age} / #{user.email} / #{user.zipcode} / #{user.insurance} / #{user.description} / #{user.created_at} / #{user.promo_code} \n \n"
    end
  end
  
  def self.create_sample
    @sample = User.create(name:'sample name', email:'genejaelee@gmail.com', gender:'Male', age:'23', description:'sample description', zipcode:'60615')
  end
  
  def self.create_with(attributes)
    a = attributes.split("/")
    User.create(id:a[0].strip, name:a[1].strip, gender:a[2].strip, age:a[3].strip, email:a[4].strip, zipcode:a[5].strip, insurance:a[6].strip, description:a[7].strip)
  end
  
  def add_responses(a)
    response_array = a.split("/")
    if self.responses.nil?
      self.responses = response_array
    elsif self.responses.length > 0
      self.responses = self.responses + response_array
    end
    puts (self.responses.to_sentence)
  end
end
