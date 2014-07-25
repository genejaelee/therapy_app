class LandingPagesController < ApplicationController
  
  def online_therapy
    @client = Client.new
  end
  
  def online_counseling
    @client = Client.new
  end
  
  def therapist
    @client = Client.new
  end
  
  def depression_counseling
    @client = Client.new
  end
end
