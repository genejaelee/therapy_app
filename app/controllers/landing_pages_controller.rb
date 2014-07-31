class LandingPagesController < ApplicationController
  before_filter :check_amount
  
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
  
  def depressed
    @client = Client.new
  end
  
  def depression
    @client = Client.new
  end
  
  def sorry
    params[:instant_therapy_click] = true
    @emails = EmailBox.new
  end
  
  def drop_email
    @emails = EmailBox.create
    if @emails.update_attributes(email: params[:email_box][:email], landing: params[:email_box][:landing])
      session[:instant_therapy_email] = true
      redirect_to root_url
      flash[:success] = "Thanks for reaching out. We will contact you"
    else
      redirect_to root_url
      flash[:fail] = "Sorry there was an error processing your entries."
    end
  end
  
  def check_amount
    if session[:amount].nil?
      if params[:ba4] == 'z1m'
        session[:amount] = 4500
      else
        session[:amount] = 3000
      end
    end
  end
end
