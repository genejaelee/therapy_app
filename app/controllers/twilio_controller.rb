class TwilioController < ApplicationController
  include Webhookable
  skip_before_action :verify_authenticity_token
 
  def voice
    caller_id = '+12132925011'
    number = params[:To]
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
    render :text => response.text
  end
  
  def index
  end
end