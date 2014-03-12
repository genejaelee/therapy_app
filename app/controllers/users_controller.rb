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
      redirect_to homepage_path
    else
      #flash[:failure] = @user.errors.full_messages.to_sentence
      session[:user] = user_params
      render "static_pages/home"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :zipcode)
  end
end
