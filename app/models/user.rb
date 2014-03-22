class User < ActiveRecord::Base
  include Encryption
  
  attr_encrypted :name, :email, :zipcode, :description, :gender, :age, :insurance, :key => :encryption_key
  attr_accessor :should_validate_age, :stripe_token, :paid
  
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
  
  def charge_user
    @amount = 400
    
    customer = Stripe::Customer.create(
      :email => self.email,
      :card => self.stripe_token
    )
    
    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => 'Rails Stripe customer',
      :currency => 'usd'
    )
  end
  
end   

class User
  def self.list
    puts "All attributes of users"
    self.all.each do |user|
      puts "#{user.id} / #{user.name} / #{user.gender} / #{user.age} / #{user.email} / #{user.zipcode} / #{user.insurance} / #{user.description} / #{user.created_at} \n \n"
    end
  end
end
