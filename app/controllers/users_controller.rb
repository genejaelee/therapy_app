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
    else
      render "static_pages/home"
    end
  end
  
  def update
    @user = User.find(session[:current_user_id])
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
    params.require(:user).permit(:name, :email, :zipcode, :age, :insurance, :gender, :description)
  end
end
