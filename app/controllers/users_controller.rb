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
      flash[:success] = "Thanks for signing up!"
      redirect_to homepage_path
    else
      render :fail
      flash.now[:failure] = "Sorry!"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :zipcode)
  end
end
