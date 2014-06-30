class RegistrationsController < Devise::RegistrationsController
  protected
  before_filter :get_return_to, :get_time_zone
  
  def after_sign_up_path_for(resource)
    if params[:suggested_times].present?
      session[:suggested_times] = params[:suggested_times]
      session[:description] = params[:event][:description]
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
end
