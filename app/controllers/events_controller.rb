class EventsController < ApplicationController
  def create
    if @_current_client.nil?
      puts "current client nil, creating new"
      @client = Client.new(params[:client])
      @event = @client.events.new(event_params)
    else
      @client = @_current_client
      @event = @client.events.new(event_params)
    end
    if @event.save
      render 'clients/update'
    else
      redirect_to :controller => 'therapists', :action => 'index', :messages => "error"
      flash[:fail] = "Sorry there was an error processing your entries."
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
