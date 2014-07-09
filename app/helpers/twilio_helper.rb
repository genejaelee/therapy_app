module TwilioHelper 
  def other_name
    default_client = 'jenny'
    @from = current_user.email.split('@')[0]
    puts "from id is #{@from}"
    @chat = Chat.find_by(id: session[:chat_id])
    if current_user.role_type == "Therapist"
      @to_call_email = @chat.client.user.email
      @username = @to_call_email.split('@')[0]
    elsif current_user.role_type == "Client"
      @to_call_email = @chat.therapist.user.email
      @username = @to_call_email.split('@')[0]
    end
    if @username.nil?
      @username = default_client
    end
    puts "to id is #{@username}"
    return @username
  end
  
  def client_name
    return current_user.email.split('@')[0]
  end
  
  def twilio_token
    capability = Twilio::Util::Capability.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    capability.allow_client_outgoing "AP1cee76b44225ccf0c74cffb3d1ef4078"
    capability.allow_client_incoming client_name
    capability.generate
  end
  
  def test_twilio_token
    capability = Twilio::Util::Capability.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    capability.allow_client_outgoing "AP1cee76b44225ccf0c74cffb3d1ef4078"
    capability.allow_client_incoming 'jenny'
    capability.generate
  end
end