class TwilioController < ApplicationController
  include Webhookable
  skip_before_action :verify_authenticity_token
  before_action :get_number
 
  def voice
    caller_id = '2132925011'
    number = params[:PhoneNumber]
    puts "voice post made for number #{number}"
    response = Twilio::TwiML::Response.new do |r|
      # Should be your Twilio Number or a verified Caller ID
      r.Dial :callerId => caller_id do |d|
        # Test to see if the PhoneNumber is a number, or a Client ID. In
        # this case, we detect a Client ID by the presence of non-numbers
        # in the PhoneNumber parameter.
        puts "supposedly dialing number #{number}"
        d.Client number
      end
    end
    return response.text
  end
  
  def incoming
    response = Twilio::TwiML::Response.new do |r|
      r.Dial  do |d|
        d.Client 'jenny'
      end
    end

    render :text => response.text
  end
  
  def index
  end
  
  def get_number
    number = params[:PhoneNumber]
  end
end