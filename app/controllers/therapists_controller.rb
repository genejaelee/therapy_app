class TherapistsController < ApplicationController
  #before_filter :authenticate_user!
  
  def home
  end
  
  def signup
    @therapist = current_therapist
    which_edit_page
  end
  
  def show_my_profile
    @therapist = current_therapist
    render 'show'
  end
  
  def show
    @therapist = Therapist.find_by_permalink(params[:id])
  end
  
  def create
    @therapist = Therapist.create(therapist_params)
    @therapist.update_attributes(:time_zone => cookies["jstz_time_zone"])
    if @therapist.save
      @therapist.create_permalink
    end
  end
  
  def update
    @therapist = current_therapist
    @therapist.should_validate_attributes = true
    if @therapist.update_attributes(therapist_params)
      render :action => 'show'
    else
      render 'therapists/signup'
    end
  end
  
  def index
    @event = Event.new
    if current_client.nil?
      puts "current client nil, creating new"
      @client = Client.create(:id => params[:id], :time_zone => cookies["jstz_time_zone"])
      session[:current_client_id] = @client.id
    else
      @client = current_client
    end
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
    params.require(:therapist).permit(:email, :password, :first_name, :title, :degree, :last_name, :gender, :state, :license_number, :school_name, :city, :zipcode, :phone, 
    :time_zone, :open_slots,
    :welcome, :bio, :approach, :approach_sub1, :approach_sub1_title, :approach_sub2, :approach_sub2_title, :issues, :avatar, 
    :permalink)
  end
end
