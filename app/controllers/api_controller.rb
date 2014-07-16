class ApiController < ApplicationController
  protect_from_forgery :except => :authenticate # stop rails CSRF protection for this action
  
  def update_nickname
    @current_user = get_current_user
    if params[:user_id] != nil && params[:nickname] != nil
      chat = Chat.find_by(id: params[:chat_id])
      user = ChatUser.user(session, @current_user, chat)
      old_nickname = user.nickname
      user.nickname = params[:nickname]
      if user.save
        payload = { :old_nickname => old_nickname, :nickname => user.nickname, :user_id => user.id }
        Pusher["presence-" + chat.channel].trigger('updated_nickname', payload)
        render :text => "SAVED"
      else
        render :text => "ERROR"
      end
    else
      render :text => "ERROR"
    end
  end

  def post_message
    @current_user = get_current_user
    chat = Chat.find(params[:chat_id])
    message = Message.create
    message.chat_id = chat.id
    
    user = ChatUser.user(session, @current_user, chat)
    message.user_id = params[:user_id]
    message.message = params[:message]
    
    payload = message.attributes
    payload[:f_created_at] = message.created_at.strftime('%a %I:%M %p %Z')
    payload[:user] = user.attributes
    
    puts(payload)
    
    if message.save
      Pusher["presence-" + chat.channel].trigger('send_message', payload)
      render :text => "sent"
    else
      render :text => "failed"
    end
  end

  def typing_status
    if params[:chat_id] != nil && params[:status] != nil
      puts "chat id params present"
      chat = Chat.find_by(id: params[:chat_id])
      user = ChatUser.find_by(id: params[:user_id])
      
      payload = { :user => user.attributes, :status => params[:status] }
      Pusher["presence-" + chat.channel].trigger('typing_status', payload)
    else
      puts "chat id params nil"
    end
    render :text => "User is typing.."
  end

  def authenticate
    if params[:user_id]
      user = ChatUser.find(params[:user_id])
      auth = Pusher[params[:channel_name]].authenticate(params[:socket_id],
        :user_id => user.id,
        :chat_user => user.attributes
      )
      render :json => auth
    else
      render :text => "Not authorized", :status => '403'
    end
  end
  
  def start_timer
    chat = Chat.find(params[:chat_id])
    user = ChatUser.user(session, current_user, chat)
    puts "time from params is #{params[:time]}"
    if chat.timer_time.nil?
      @time = params[:time]
      chat.timer_time = @time
    else
      @time = chat.timer_time
    end
    
    if chat.save
      payload = { :time => @time }
      Pusher["presence-" + chat.channel].trigger('start_timer', payload)
      render :text => "STARTED"
    end
  end
  
  def toggle_timer
    chat = Chat.find(params[:chat_id])
    user = ChatUser.user(session, current_user, chat)
    @state = params[:state]
    @time = params[:time]
    chat.update_attributes(:timer_time => @time, :timer_state => @state)
    
    if chat.save
      payload = { :time => @time, :state => @state }
      Pusher["presence-" + chat.channel].trigger('toggle_timer', payload)
      render :text => "TOGGLED"
    end
  end
  
  def reset_timer
    chat = Chat.find(params[:chat_id])
    if chat.save
      payload = { }
      Pusher["presence-" + chat.channel].trigger('reset_timer', payload)
      render :text => "RESETTED"
    end
  end
  
  def update_timer_state_and_time
    chat = Chat.find(params[:chat_id])
    chat_user = ChatUser.find_by(id: params[:user_id])
    if chat_user.user.role_type == "Therapist"
      @time = params[:time]
      @state = params[:state]
      chat.update_attributes(:timer_state => @state, :timer_time => @time)
      render :text => "UPDATED TIMER STATE AND TIME"
    else
      render :text => "NOT A THERAPIST"
    end
  end
  
  def get_timer
    chat = Chat.find(params[:chat_id])
    user = ChatUser.user(session, current_user, chat)
    @time = chat.timer_time
    @state = chat.timer_state
    
    payload = { :time => @time, :state => @state }
    Pusher["presence-" + chat.channel].trigger('get_timer', payload)
    render :text => @time
  end
  
  def get_current_user
    if user_signed_in?
      @current_user = current_user
    else
      @current_user = User.find_by(email: 'test@gmail.com')
    end
    return @current_user
  end

end
