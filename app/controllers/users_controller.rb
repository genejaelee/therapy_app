class UsersController < ApplicationController
  
  def show_my_profile
    role_type = current_user.role_type
    if role_type == "Therapist"
      @therapist = current_user.role
    elsif role_type == "Client"
      @client = current_user.role
    end
    
    render 'show'
  end
  
  private
  
  def therapist_params
    params.require(:user).permit(:role_type)
  end
end
