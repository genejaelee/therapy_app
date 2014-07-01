class RegistrationsController < Devise::RegistrationsController
  protected
  before_filter :get_return_to, :get_time_zone, :get_roles
  
  def after_sign_up_path_for(resource)
    if current_user.role_type == "Client"
      if params[:suggested_times].present?
        session[:suggested_times] = params[:suggested_times]
        session[:description] = params[:event][:description]
      end
    elsif current_user.role_type == "Therapist"
      
    end
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
