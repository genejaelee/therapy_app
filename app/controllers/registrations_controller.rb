class RegistrationsController < Devise::RegistrationsController
  protected
  before_filter :get_return_to, :get_time_zone, :get_roles
  
  def after_sign_up_path_for(resource)
    if current_user.role_type == "Client"
      find_event_and_client_or_build
      if params[:event].present?
        if params[:event][:description].nil?
          session[:description] = "nil"
        else
          session[:description] = params[:event][:description]
        end
      else
      end
    elsif current_user.role_type == "Therapist"
      @user = current_user
      @therapist = Therapist.create
      @user.role = @therapist
      @user.save
    end
    
    session[:signed_up] = true
    session[:registration_state] = "signup"
    return registrations_router
  end
  
  def get_roles
    puts 'getting roles'
    if current_user.present?
      if current_user.role.present?
        @therapist = current_user.role
        @client = current_user.role
      end
    end
  end
  
  def get_return_to
    session[:return_to] ||= request.referer
  end
  
  def get_time_zone
    @time_zone = cookies["jstz_time_zone"]
  end
end
