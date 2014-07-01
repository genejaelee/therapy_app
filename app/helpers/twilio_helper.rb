module TwilioHelper 
  def twilio_token
    capability = Twilio::Util::Capability.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    capability.allow_client_outgoing "APabe7650f654fc34655fc81ae71caa3ff"
    capability.generate
  end
end