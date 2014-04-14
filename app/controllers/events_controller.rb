class EventsController < ApplicationController
  def create
    @event = Event.create(event_params)
    if @event.user_id.nil?
      @user = @event.users.build(params[:user])
    else
      @user = @_current_user
      @event.user_id = @user.id
    end
    if @event.save
      render 'users/update'
    else
      redirect_to :controller => 'therapists', :action => 'index', :messages => "error"
    end
  end
  
  def new
    @event = Event.new(params[@therapist.id])
  end
  
  def show
    @event = Event.find_by(event_params)
  end
  
  def index
    @event = Event.scoped
    @event = Event.between(params['start'], params['end']) if (params['start'] && params['end'])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @events }
    end
  end
  
  private
  
  def event_params
    params.require(:event).permit(:therapist_id, :user_id, :title, :description, :start_time, :start_date, :time_zone, :end)
  end
end
