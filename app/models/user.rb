class User < ActiveRecord::Base
  include Encryption
  
  attr_encrypted :name, :email, :zipcode, :key => :encryption_key
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :zipcode, presence: true, length: { minimum: 5 }
  validates_format_of :zipcode, :with => /^\d{5}(?:[-\s]\d{4})?$/, multiline: true, :message => "should be in the form 12345 or 12345-1234"
  
end

class User
  def self.list
    puts "ID, Name, Email, and Zipcode"
    self.all.each do |user|
      puts "#{user.id} / #{user.name} / #{user.email} / #{user.zipcode}"
    end
  end
end
