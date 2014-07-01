module TwilioHelper 
  def client_name
    default_client = 'jenny'
    @caller_email = current_user.email
    if current_user.role_type == "Therapist"
      @email_to_call = Client.find_by(id: session[:chat_client_id]).user.email
    elsif current_user.role_type == "Client"
      @email_to_call = Therapist.find_by(id: session[:chat_therapist_id]).user.email
    end
    if @email_to_call.nil?
      @email_to_call = default_client
    end
    return @email_to_call
  end
  
  def twilio_token
    capability = Twilio::Util::Capability.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    capability.allow_client_outgoing "AP1cee76b44225ccf0c74cffb3d1ef4078"
    capability.allow_client_incoming :client_name
    capability.generate
  end
end