class ChatUser < ActiveRecord::Base
  belongs_to :therapist
  belongs_to :client
  
  def self.user(session, current_user)
    
    if current_user.role.chat_user.nil?
      user = current_user.role.build_chat_user
      user.nickname = "user_" + Time.now.to_i.to_s
      if user.save
        session[:user_id] = user.id
      end
    else
      puts "current user role type is #{current_user.role_type} and id is #{current_user.id}"
      user = current_user.role.chat_user
    end

    # Return the user
    user
    
  end
  
end
