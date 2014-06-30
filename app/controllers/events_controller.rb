class EventsController < ApplicationController
  
  def new
    @event = Event.new(params[@therapist.id])
  end
  
  def show
    @event = Event.find_by(event_params)
  end
  
  def create
    if current_user.nil?
      puts "current user nil"
      session[:event] = params[:event]
      @event = Event.new(event_params)
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
      redirect_to '/session_details'
    end
    session[:event_id] = @event.id
  end
  
  def session_details
    @user = current_user
    @client = @user.role
    @time_zone = @user.time_zone
    @event = @client.events.find_by(id: session[:event_id])
    @therapist = @event.therapist
  end
  
  def update_session
    @user = current_user
    @client = @user.role
    @event = @client.events.find_by(id: session[:event_id])
    @user.update_attributes(:time_zone => params[:user][:time_zone])
    
    @event.update_values_with_timezone(@event.client_id, @event.therapist_id, params[:event][:description], params[:suggested_times], @user.time_zone)
    
    if @event.save
      session[:event_id] = @event.id
      session[:event] = nil
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
      therapist_id = session[:event]["therapist_id"]
      @event.update_values_with_timezone(client_id, therapist_id, session[:description], session[:suggested_times], @user.time_zone)
    else
      @client = Client.find_by_id(session[:event]["client_id"])
      @client.save
      
      # find event and save it to client
      @event = @client.events.new
      client_id = session[:event]["client_id"]
      therapist_id = session[:event]["therapist_id"]
      description = session[:event]["description"]
      
      @user = current_user
      @user.role = @client
      
      @event.update_values_with_timezone(client_id, therapist_id, session[:description], session[:suggested_times], @user.time_zone)
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
  
  def index
    @event = Event.all
  end
  
  private
  
  def event_params
    params.require(:event).permit(:therapist_id, :client_id, :title, :description, :suggested_times)
  end
end
