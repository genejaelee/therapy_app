class EventsController < ApplicationController
  def create
    if @_current_user.nil?
      @user = User.create(params[:user])
      @event = @user.events.create(event_params)
    else
      @user = @_current_user
      @event = @user.events.create(event_params)
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
    @events = Event.where(therapist_id: therapist_id).load
    @events.each do |f|
      puts f.start_date
    end
    respond_to do |format|
      format.json { render :json => @events }
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
