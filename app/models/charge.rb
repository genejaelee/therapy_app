class Charge < ActiveRecord::Base
  attr_accessor :token, :user, :email
end
