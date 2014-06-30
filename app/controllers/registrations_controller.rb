class RegistrationsController < Devise::RegistrationsController
  protected
  before_filter :get_return_to, :get_time_zone, :get_session_ids
  
  def after_sign_up_path_for(resource)
    if params[:suggested_times].present?
      session[:suggested_times] = params[:suggested_times]
      session[:description] = session[:event][:description]
    end
    return registrations_router
  end
  
  def edit
    @therapist = current_user.role
    @client = current_user.role
  end
  
  def get_return_to
    session[:return_to] ||= request.referer
  end
  
  def get_time_zone
    @time_zone = cookies["jstz_time_zone"]
    puts "#{@time_zone}"
  end
  
  def get_session_ids
    @session_client_id = session[:event][:client_id]
    @session_therapist_id = session[:event][:therapist_id]
    @session_event_id = session[:event_id]
  end
end
