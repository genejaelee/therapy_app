class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_filter { response.headers['P3P'] = %q|CP="HONK"| }
  protect_from_forgery with: :exception
  around_filter :user_time_zone, :if => :current_user
  helper_method :current_client
  
  def after_sign_in_path_for(resource)
    @user = current_user
    @return_path = Rails.application.routes.recognize_path(session[:return_to])
    
    if @user.role_type == "Client"
      puts "signed in user is client, return finish event"
      
      if session[:event].present?
        return '/event/finish'
      end
    end
    
    puts "request referer is #{@return_path}"
    return session[:return_to]
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
  
  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:role_type, :email, :password, :password_confirmation) }
  end
  
  def current_client
      @_current_client ||= session[:current_client_id] &&
        Client.find_by(id: session[:current_client_id])
  end

  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
