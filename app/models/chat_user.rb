class ChatUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :chat
  
  def self.user(session, current_user, chat)
    if chat.channel == "message_channel_test" || chat.channel == "message_channel_demo"
      user = set_test_user(session, current_user, chat)
    elsif chat.chat_users.find_by(user_id: current_user.id).present?
      user = chat.chat_users.find_by(user_id: current_user.id)
      user.time_zone = current_user.time_zone
      if user.save
        session[:chat_user_id] = user.id
      end
    else
      user = current_user.chat_users.create
      nickname = "user_" + Time.now.to_i.to_s
      time_zone = current_user.time_zone
      chat_id = chat.id

      if user.update_attributes(:nickname => nickname, :time_zone => time_zone, :chat_id => chat_id)
        session[:chat_user_id] = user.id
      end
    end

    # Return the user
    user
    
  end
  
  def self.set_test_user(session, current_user, chat)
    current_user = User.find_by(email: 'test@gmail.com')
    if session[:chat_user_id].present?
      user = ChatUser.find_by(id: session[:chat_user_id])
      nickname = user.nickname
    else
      user = current_user.chat_users.create
      nickname = "user_" + Time.now.to_i.to_s
    end
    chat_id = chat.id
    
    if user.update_attributes(:nickname => nickname, :chat_id => chat_id, :user_id => current_user.id)
      session[:chat_user_id] = user.id
    end
    
    return user
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
  
  def self.assign_events_to_user
    Event.all.each do |event|
      if event.therapist_id.present?
        event.user_id = User.find_by(role_id: event.therapist_id)
      end
      if event.client_id.present?
        event.user_id = User.find_by(role_id: event.therapist_id)
      end
    end
  end
  
  def self.assign_to_chats
    Chat.all.each do |chat|
      unless User.find_by(role_id: chat.client_id).nil?
        if chat.chat_users.find_by(user_id: User.find_by(role_id: chat.client_id).id) == nil?
          @chat_user = chat.build_chat_user
          @chat_user.update_attributes(:user_id => User.find_by(role_id: chat.client_id).id, :chat_id => chat.id)
        end
      end
      unless User.find_by(role_id: chat.therapist_id).nil?
        if chat.chat_users.find_by(user_id: User.find_by(role_id: chat.therapist_id).id) == nil?
          @chat_user = chat.build_chat_user
          @chat_user.update_attributes(:user_id => User.find_by(role_id: chat.client_id).id, :chat_id => chat.id)
        end
      end
    end
  end
end
