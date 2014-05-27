class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
    @user.update_attributes(:time_zone => cookies["jstz_time_zone"])
    session[:current_user_id] = @user.id
    redirect_to :controller => 'therapists', :action => 'index'
  end
  
  def create
    @user = User.new(user_params)
    @user.update_attributes(:time_zone => cookies["jstz_time_zone"])
    if @user.save
      session[:current_user_id] = @user.id
      #if @user.promo_code == "WHISPER033"
        #render "users/create"
        redirect_to :controller => 'therapists', :action => 'index'
        #else
        #render :action => :charge
        #end
    else
      render "static_pages/home"
    end
  end
  
  def charge
  end
  
  def save_c
    @user = @_current_user
    @user.stripe_token = params[:stripeToken]
    @user.email = params[:stripeEmail]
    @user.save
    @user.save_user_card
    
    render "users/finish"
    reset_session
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    render "users/save_c"
  end
  
  def update
    @user = @_current_user
    @user.should_validate = true
    if @user.update_attributes(user_params)
      session[:current_user_id] = @user.id
      render 'users/save_c'
    else
      render "users/update"
    end
  end
  
  def finish
    @user = @_current_user
    if @user.update_attributes(user_params)
      @user.save
      reset_session
    else
      render "users/update"
      flash[:fail] = "Sorry there was an error processing your entries."
    end
  end
  
  def drop_email
    @user = @_current_user
    if @user.update_attributes(user_params)
      redirect_to root_url
      flash[:success] = "Thanks for reaching out."
    else
      redirect_to :controller => 'therapists', :action => 'index'
      flash[:fail] = "Sorry there was an error processing your entries."
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :phone, :email, :zipcode, :time_zone, :age, :insurance, :gender, :gender_pref, :description, :promo_code, :current_therapist, :current_therapist_name, :price, 
    :stripe_token,
    :flag_therapist)
  end
end
