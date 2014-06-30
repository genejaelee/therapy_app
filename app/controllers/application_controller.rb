class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_filter { response.headers['P3P'] = %q|CP="HONK"| }
  protect_from_forgery with: :exception
  around_filter :user_time_zone, :if => :current_user
  helper_method :current_client, :registrations_router
  
  def after_sign_in_path_for(resource)
    return registrations_router
  end
  
  def drop_email
    @emails = EmailBox.create
    if @client.update_attributes(client_params)
      redirect_to root_url
      flash[:success] = "Thanks for reaching out."
    else
      redirect_to :controller => 'therapists', :action => 'index'
      flash[:fail] = "Sorry there was an error processing your entries."
    end
  end
  
  def registrations_router
    @user = current_user
    
    if @user.role_type == "Therapist"
      puts "signed up user is therapist"
      routed_path = update_therapist_path
    elsif @user.role_type == "Client" && session[:event].present? && session[:suggested_times].present?
      routed_path = '/event/finish'
    elsif @user.role_type == "Client" && session[:event].present?
      routed_path = '/session_details'
    elsif @user.role_type == "Client"
      routed_path = session[:return_to]
      session[:return_to] = nil
    else
      routed_path = homepage_path
    end
    return routed_path
  end
  
  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:role_type, :email, :password, :password_confirmation, :time_zone) }
  end
  
  def current_client
      @_current_client ||= session[:current_client_id] &&
        Client.find_by(id: session[:current_client_id])
  end

  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
