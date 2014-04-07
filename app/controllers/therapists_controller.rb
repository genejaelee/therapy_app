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
  
  def new
  end
  
  private
  
  def therapist_params
    params.require(:therapist).permit(:email, :password, :first_name, :title, :degree, :last_name, :gender, :state, :license_number, :city, :zipcode, :phone, :bio, :issues, :avatar, :permalink)
  end
end
