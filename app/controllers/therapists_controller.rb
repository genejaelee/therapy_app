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
      redirect_to :controller => 'users', :action => 'show_my_profile'
    else
      render 'therapists/signup'
    end
  end
  
  def index
    @emails = EmailBox.new
    @event = Event.new
    @client = Client.create(params[:client])
    @time_zone = cookies["jstz_time_zone"]
    @therapist = Therapist.all
    
    session[:browsing] = true
    if user_signed_in?
      
    end
  end
  
  def drop_email
    @emails = EmailBox.create
    if @emails.update_attributes(email: params[:email_box][:email], landing: params[:email_box][:landing])
      redirect_to root_url
      flash[:success] = "Thanks for reaching out. We will contact you"
    else
      redirect_to :controller => 'therapists', :action => 'index'
      flash[:fail] = "Sorry there was an error processing your entries."
    end
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
    params.require(:therapist).permit(:id, :first_name, :title, :degree, :last_name, :gender, :state, :license_number, :school_name, :city, :zipcode, :phone, 
    :open_slots,
    :welcome, :bio, :approach, :approach_sub1, :approach_sub1_title, :approach_sub2, :approach_sub2_title, :issues, :avatar, 
    :permalink, user_attributes: [ :id, :email, :password ])
  end
end
