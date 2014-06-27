class TherapistsController < ApplicationController
  
  def home
  end
  
  def signup
    @therapist = current_user.role
  end
  
  def show
    @therapist = Therapist.find_by_permalink(params[:id])
  end
  
  def create
    @therapist = Therapist.create(therapist_params)
    if @therapist.save
      @therapist.create_permalink
    end
  end
  
  def update
    @therapist = current_user.role
    @therapist.should_validate_attributes = true
    if @therapist.update_attributes(therapist_params)
      render :action => 'show'
    else
      render 'therapists/signup'
    end
  end
  
  def index
    @emails = EmailBox.create
    @event = Event.new
    @client = Client.create(params[:client])
    @therapist = Therapist.all
  end
  
  def about
  end
  
  def privacy
  end
  
  def terms
  end
  
  def new
  end
  
  private
  
  def therapist_params
    params.require(:therapist).permit(:first_name, :title, :degree, :last_name, :gender, :state, :license_number, :school_name, :city, :zipcode, :phone, 
    :open_slots,
    :welcome, :bio, :approach, :approach_sub1, :approach_sub1_title, :approach_sub2, :approach_sub2_title, :issues, :avatar, 
    :permalink, user_attributes: [ :id, :email, :password ])
  end
end
