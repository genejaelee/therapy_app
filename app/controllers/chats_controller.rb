class ChatsController < ApplicationController
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  
  def new
    puts "creating new chat"
    chat = Chat.new
    chat.owner = ChatUser.user(session)
    chat.owner.update_attributes(:time_zone => cookies["jstz_time_zone"])
    if chat.save
      chat_tiny = Tiny::tiny(chat.id)
      puts "chat id is #{chat.id}"
        chat.channel = "message_channel_" + chat.id.to_s
        chat.save
      redirect_to :action => "view", :id => chat_tiny
    end
  end

  def view
    @chat = Chat.find(Tiny::untiny(params[:id]))
    puts "#{current_user.role.id}, #{@chat.therapist_id}, #{@chat.client_id}"
    if current_user.role.id == @chat.therapist_id || current_user.role.id == @chat.client_id
    
      if(params[:id] != nil)
        @chat = Chat.find(Tiny::untiny(params[:id]))
        @user = ChatUser.user(session, current_user)
        @messages = Message.where("chat_id = ?", @chat.id.to_s).load
      else
        redirect_to :controller => 'index', :action => 'index'
      end
    else
      redirect_to unauthorized_chat_path
      flash[:error] = "You are not authorized to enter this chat"
    end
  end
  
  def generate
    @client = current_user.role
    puts "finding event by session event id #{session[:event_id]}"
    @event = @client.events.find_by(id: session[:event_id])
    
    puts "making new chat"
    chat = @client.chats.new
    chat.therapist_id = @event.therapist_id
    chat.event_id = @event.id
    chat.owner = ChatUser.user(session, current_user)
    if chat.save
      chat_tiny = Tiny::tiny(chat.id)
      puts "chat id is #{chat.id}"
      chat.channel = "message_channel_" + chat.id.to_s
      chat.save
      session[:event_id] = nil
      redirect_to :action => "show_my_profile", :controller => "users"
    else
      redirect_to homepage_path
      flash[:error] = "There was an error generating the chatroom"
    end
  end
  
  def unauthorized
  end
end
