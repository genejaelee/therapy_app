class UsersController < ApplicationController
  
  def show_my_profile
    if !user_signed_in?
      deny_access
    else
      role_type = current_user.role_type
      if role_type == "Therapist"
        @therapist = current_user.role
      elsif role_type == "Client"
        @client = current_user.role
      end
    
      render 'show'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:role_type, :time_zone, :events_attributes => [:id, :therapist_id, :client_id, :title, :description, :suggested_times])
  end
end
