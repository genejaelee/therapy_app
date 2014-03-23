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
      @user.apply_promo
      session[:current_user_id] = @user.id
      if @user.promo_code == "WHISPER033"
        render "users/create"
      else
        render :action => :charge
      end
    else
      render "static_pages/home"
    end
  end
  
  def charge 
    @user = @_current_user
    @user.apply_promo
    @user.stripe_token = params[:stripeToken]
    @user.charge_user(@user.price)
    
    render "users/create"
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
  end
  
  def update
    @user = @_current_user
    if @user.update_attributes(user_params)
      session[:current_user_id] = @user.id
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
    params.require(:user).permit(:name, :email, :zipcode, :age, :insurance, :gender, :description, :promo_code, :price)
  end
end
