class EventsController < ApplicationController
  
  def new
    @event = Event.new(params[@therapist.id])
  end
  
  def show
    @event = Event.find_by(event_params)
  end
  
  def find_client_or_build
    if current_user.present?
      if current_user.role.present?
        
      end
    elsif current_user.nil?
    end
  end
  
  def create
    session[:event] = params[:event]
    if current_user.nil?
      puts "current user nil"
      @event = Event.new(event_params)
      @event.save
      get_session_ids
      session[:event_id] = @event.id
      redirect_to new_user_registration_path
      #go to sign up or login!
    else
      @time_zone = current_user.time_zone
      if current_user.role.present?
        @client = current_user.role
        @event = @client.events.new(event_params)
      else
        @client = Client.new(params[:client])
        @client.save
        @event = @client.events.new(event_params)
      end
      
      @event.save
      session[:event_id] = @event.id
      redirect_to '/session_details'
    end
  end
  
  def session_details
    @user = current_user
    get_session_ids
    if @user.role.present?
      @client = @user.role
    elsif Client.find_by(id: @session_client_id).present?
      @client = Client.find_by(id: @session_client_id)
      @user.role = @client
      @user.save
    else
      @client = @user.build_client
    end
    @client.save
    @time_zone = @user.time_zone
    @event = Event.find_by(id: session[:event_id])
    @therapist = @event.therapist
  end
  
  def update_session
    @user = current_user
    @client = @user.role
    @client.save
    @event = Event.find_by(id: session[:event_id])
    
    # check if login or signup
    if params[:user].present?
      @user.update_attributes(:time_zone => params[:user][:time_zone])
    end
    
    get_session_ids
    
    if current_user.role.present?
      client_id = @client.id
    else
      client_id = @session_client_id
    end
    
    @event.update_values_with_timezone(client_id, @session_therapist_id, params[:event][:description], params[:suggested_times], @user.time_zone)
    
    if @event.save
      session[:event] = nil
      session[:event_id] = @event.id
    end
    
    if @user.save
      redirect_to :action => "new", :controller => "charges"
    end
  end
  
  def finish
    if current_user.role.present?
      @user = current_user
      @client = @user.role
      @event = @client.events.new
      
      client_id = @client.id
      get_session_ids
      
      @event.update_values_with_timezone(client_id, @session_therapist_id, session[:description], session[:suggested_times], @user.time_zone)
    else
      @client = Client.find_by_id(session[:event]["client_id"])
      @client.save
      
      # find event and save it to client
      @event = @client.events.new
      get_session_ids
      
      @user = current_user
      @user.role = @client
      
      @event.update_values_with_timezone(@session_client_id, @session_therapist_id, session[:description], session[:suggested_times], @user.time_zone)
    end
    
    if @event.save
      session[:event_id] = @event.id
      session[:event] = nil
      session[:description] = nil
    end
    
    if @user.save
      redirect_to :action => "new", :controller => "charges"
    end
  end
  
  def get_session_ids
    @session_client_id = session[:event][:client_id]
    @session_therapist_id = session[:event][:therapist_id]
    @session_event_id = session[:event_id]
  end
  
  def index
    @event = Event.all
  end
  
  private
  
  def event_params
    params.require(:event).permit(:id, :therapist_id, :client_id, :title, :description, :suggested_times)
  end
end
