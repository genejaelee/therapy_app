class EventsController < ApplicationController
  def create
    @user = @_current_user
    @event = Event.create(event_params)
    @event.user_id = @user.id
    if @event.save
      render 'users/charge'
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
    params.require(:event).permit(:therapist_id, :user_id, :title, :description, :start_time, :start_date, :end)
  end
end
