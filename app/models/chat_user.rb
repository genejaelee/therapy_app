class ChatUser < ActiveRecord::Base
  belongs_to :user
  
  def self.user(session, current_user, chat)
    
    if current_user.chat_user.nil?
      user = current_user.build_chat_user
      user.nickname = "user_" + Time.now.to_i.to_s
      user.time_zone = current_user.time_zone
      if user.save
        session[:user_id] = user.id
      end
    elsif current_user.chat_user.present?
      puts "current user role type is #{current_user.role_type} and id is #{current_user.id}"
      user = current_user.chat_user
      user.time_zone = current_user.time_zone
      if user.save
        session[:user_id] = user.id
      end
    end

    # Return the user
    user
    
  end
  
  def self.assign_to_users
    ChatUser.all.each do |chatuser|
      if chatuser.client_id.present?
        unless User.find_by(role_id: chatuser.client_id).nil?
          chatuser.user_id = User.find_by(role_id: chatuser.client_id).id
        end
      elsif chatuser.therapist_id.present?
        unless User.find_by(role_id: chatuser.therapist_id)
          chatuser.user_id = User.find_by(role_id: chatuser.therapist_id).id
        end
      end
      chatuser.save
    end
  end
end
