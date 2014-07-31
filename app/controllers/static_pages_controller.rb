class StaticPagesController < ApplicationController
  before_filter :get_application_amount
  
  def home
    @client = Client.new
  end
  
  def about
    @client = Client.new
  end
  
  def privacy
    @client = Client.new
  end
  
  def terms
    @client = Client.new
  end
  
  def emergencies
    @client = Client.new
  end
  
  def get_application_amount
    @amount = get_amount
  end
end
