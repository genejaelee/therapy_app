class EventsController < ApplicationController
  
  def new
    @event = Event.new(params[@therapist.id])
  end
  
  def show
    @event = Event.find_by(event_params)
  end
  
  def create
    @event = Event.create(event_params)
    session[:event_id] = @event.id
    puts "#{session[:event_id]}"
    #@formatted_times = @event.format_suggested_times_with_timezone(params[:suggested_times], params[:user][:time_zone])
    #@event.update_attributes(:suggested_times => @formatted_times)
    if current_user.nil?
      redirect_to new_user_registration_path
    else
      if current_user.role_type == "Therapist"
        redirect_to homepage_path
        flash[:error] = "Oops, looks like you are signed in as a therapist."
      else
        find_event_and_client_or_build
        redirect_to new_user_session_path
      end
    end
  end
  
  def initial_talk
    @event = Event.create(event_params)
  end
  
  def session_details
    @user = current_user
    find_event_and_client_or_build
    @time_zone = @user.time_zone
    @therapist = @event.therapist
  end
  
  def update_session
    @user = current_user
    find_event_and_client_or_build
    @event.update_attributes(:user_id => current_user.id, :description => params[:event][:description])
    # check if login or signup
    if params[:user].present?
      @user.update_attributes(:time_zone => params[:user][:time_zone])
    end
    
    if @event.save
      session[:event_id] = @event.id
      session[:suggested_times] = nil
      session[:description] = nil
    end
    
    if @user.save
      redirect_to :action => "new", :controller => "charges"
    else
      puts "user did not save"
      redirect_to homepage_path
    end
  end
  
  def finish
    @user = current_user
    find_event_and_client_or_build
    @event.update_attributes(:user_id => current_user.id, :description => session[:description])
    
    if @event.save
      session[:event_id] = @event.id
      session[:suggested_times] = nil
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
    params.require(:event).permit(:id, :therapist_id, :client_id, :title, :description, :email, :phone, :suggested_times, :suggested_time)
  end
end
