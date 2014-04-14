class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
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
  
  def save_c
    @user = @_current_user
    @user.stripe_token = params[:stripeToken]
    @user.email = params[:stripeEmail]
    @user.save_user_card
    render "users/finish"
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    
    if @user.update_attributes(user_params)
      @user.save
      reset_session
    else
      render "users/save_c"
      flash[:fail] = "Sorry there was an error processing your entries."
    end
  end
  
  def update
    @user = @_current_user
    if @user.update_attributes(user_params)
      session[:current_user_id] = @user.id
      render 'users/save_c'
    else
      render "users/create"
    end
  end
  
  def finish
    @user = User.find(session[:current_user_id])
    @user.should_validate_age = true
    if @user.update_attributes(user_params)
      @user.save
      reset_session
    else
      render "users/update"
      flash[:fail] = "Sorry there was an error processing your entries."
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :zipcode, :age, :insurance, :gender, :gender_pref, :description, :promo_code, :current_therapist, :current_therapist_name, :price, 
    :stripe_token)
  end
end
