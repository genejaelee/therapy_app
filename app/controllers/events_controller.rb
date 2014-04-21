class EventsController < ApplicationController
  def create
    if @_current_user.nil?
      @user = User.new(params[:user])
      @event = @user.events.new(event_params)
    else
      @user = @_current_user
      @event = @user.events.new(event_params)
    end
    if @event.save
      render 'users/update'
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
    @events = Event.where(therapist_id: therapist_id, start_date: date).load
    #return array with appointment times formatted for user time zone
    @times_array = Event.format_date_time(@events, @_current_user, @therapist, date)
    puts "user date time array is #{@times_array}"
    respond_to do |format|
      format.json { render :json => @times_array }
    end
  end
  
  def index
    @event = Event.scoped
    @event = Event.between(params['start'], params['end']) if (params['start'] && params['end'])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @event }
    end
  end
  
  private
  
  def event_params
    params.require(:event).permit(:therapist_id, :user_id, :title, :description, :start_time, :start_date, :time_zone, :end)
  end
end
