class User < ActiveRecord::Base
  include Encryption
  
  attr_encrypted :name, :email, :zipcode, :description, :gender, :age, :insurance, :key => :encryption_key
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :zipcode, presence: true, length: { minimum: 5 }
  validates_format_of :zipcode, :with => /^\d{5}(?:[-\s]\d{4})?$/, multiline: true, :message => "should be in the form 12345 or 12345-1234"
  validates :description, presence: true, :on => :update
  
  validates :age, presence: true, numericality: true, :on => :update, :if => :should_validate_age?
  
  attr_accessor :should_validate_age
  
  def should_validate_age?
    should_validate_age || new_record?
  end
end

class User
  def self.list
    puts "All attributes of users"
    self.all.each do |user|
      puts "#{user.id} / #{user.name} / #{user.gender} / #{user.age} / #{user.email} / #{user.zipcode} / #{user.insurance} / #{user.description}"
    end
  end
end
