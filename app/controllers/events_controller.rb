class EventsController < ApplicationController
  
  def create
    if current_user.nil?
      puts "current user nil"
      session[:event] = params[:event]
      puts "#{session[:event]}"
      redirect_to new_user_session_path
    elsif current_user.role.present?
      @client = current_user.role
      @event = @client.events.new(event_params)
      @event.save
      redirect_to :action => "new", :controller => "charges"
    else
      @client = Client.new(params[:client])
      @client.save
      @event = @client.events.new(event_params)
      @event.save
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
      description = session[:event]["description"]
      
      @event.update_attributes({"client_id" => client_id, "therapist_id" => therapist_id, "description" => description})
      puts "saving event"
      @event.save
    else
      @client = Client.find_by_id(session[:event]["client_id"])
      puts "client id is #{@client.id}, saving now"
      @client.save
      
      # find event and save it to client
      @event = @client.events.new
      client_id = session[:event]["client_id"]
      therapist_id = session[:event]["therapist_id"]
      description = session[:event]["description"]
      puts "updating attributes"
      @event.update_attributes({"client_id" => client_id, "therapist_id" => therapist_id, "description" => description})
      puts "saving event"
      @event.save
    
      @user = current_user
      @user.role = @client
    end
    
    if @user.save
      redirect_to :action => "new", :controller => "charges"
      session[:event] = nil
    end
  end
  
  def new
    @event = Event.new(params[@therapist.id])
  end
  
  def show
    @event = Event.find_by(event_params)
  end
  
  def this_therapist_events
    therapist_id = params[:therapist_id]
    date = params[:date]
    @therapist = Therapist.find_by_id(therapist_id)
    #loads all events, inefficient but works for now
    @events = Event.where(therapist_id: therapist_id).load
    #return array with appointment times formatted for client time zone
    if @_current_client.nil?
      puts "current client nil, creating new"
      @client = Client.create(:id => params[:id], :time_zone => cookies["jstz_time_zone"])
      session[:current_client_id] = @client.id
    else
      @client = @_current_client
    end
    
    @times_array = Event.format_date_time(@events, @client, @therapist, date)
    puts "client date time array is #{@times_array}"
    respond_to do |format|
      format.json { render :json => @times_array }
    end
  end
  
  def index
    @event = Event.all
  end
  
  private
  
  def event_params
    params.require(:event).permit(:therapist_id, :client_id, :title, :description, :start_time, :start_date, :time_zone, :end)
  end
end
