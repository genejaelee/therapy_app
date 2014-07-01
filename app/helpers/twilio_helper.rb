module TwilioHelper 
  def client_name
    default_client = 'jenny'
    @from = current_user.id
    puts "from id is #{@from}"
    if current_user.role_type == "Therapist"
      @to_call = Client.find_by(id: session[:chat_client_id]).user.id
    elsif current_user.role_type == "Client"
      @to_call = Therapist.find_by(id: session[:chat_therapist_id]).user.id
    end
    if @to_call.nil?
      @to_call = default_client
    end
    puts "to id is #{@to_call}"
    return @to_call
  end
  
  def twilio_token
    capability = Twilio::Util::Capability.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    capability.allow_client_outgoing "AP1cee76b44225ccf0c74cffb3d1ef4078"
    capability.allow_client_incoming 'therapistgmail.com'
    capability.generate
  end
end