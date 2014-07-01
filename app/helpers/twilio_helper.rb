module TwilioHelper 
  def client_name
    @client_name = current_user.email
    if @client_name.nil?
      @client_name = default_client
    end
    return @client_name
  end
  
  def twilio_token
    capability = Twilio::Util::Capability.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    capability.allow_client_outgoing "AP1cee76b44225ccf0c74cffb3d1ef4078"
    capability.allow_client_incoming client_name
    capability.generate
  end
end