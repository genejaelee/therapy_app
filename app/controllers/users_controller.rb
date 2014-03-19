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
      flash[:success] = "Thanks for signing up! We will contact you shortly."
      session[:current_user_id] = @user.id
    else
      render "static_pages/home"
    end
  end
  
  def update
    @user = User.find(session[:current_user_id])
    if @user.update_attributes(user_params)
    else
      render "users/create"
      flash[:fail]
    end
  end
  
  def finish
    @user = User.find(session[:current_user_id])
    if @user.update_attributes(user_params)
      redirect_to homepage_path
    else
      render "users/create"
      flash[:fail]
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :zipcode, :age, :insurance, :gender, :description, :gender_pref)
  end
end
