class StaticPagesController < ApplicationController
  
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
end
