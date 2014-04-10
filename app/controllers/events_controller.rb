class EventsController < ApplicationController
  def create
    @therapist = current_user
    @event = @therapist.events.build(params[:event])
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
    params.require(:event).permit(:therapist_id, :title, :description, :start, :end)
  end
end
