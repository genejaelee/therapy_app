class TwilioController < ApplicationController
  include Webhookable
  skip_before_action :verify_authenticity_token
 
  def voice
    caller_id = '12132925011'
    puts 'voice post made'
    number = params[:PhoneNumber]
    response = Twilio::TwiML::Response.new do |r|
      # Should be your Twilio Number or a verified Caller ID
      r.Dial :callerId => caller_id do |d|
        # Test to see if the PhoneNumber is a number, or a Client ID. In
        # this case, we detect a Client ID by the presence of non-numbers
        # in the PhoneNumber parameter.
        if /^[\d\+\-\(\) ]+$/.match(number)
            d.Number(CGI::escapeHTML number)
        else
            d.Client number
        end
      end
    end
    response.text
    render 'twilio/index'
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
end