class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_filter { response.headers['P3P'] = %q|CP="HONK"| }
  protect_from_forgery with: :exception
  around_filter :user_time_zone, :if => :current_user
  helper_method :current_client, :registrations_router
  
  def after_sign_in_path_for(resource)
    session[:registration_state] = "login"
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
      if session[:registration_state] == "login"
        routed_path = show_my_profile_path
      elsif session[:registration_state] == "signup"
        routed_path = update_therapist_path
      end
      session[:registration_state] == nil
    elsif @user.role_type == "Client" && session[:event_id].present? && session[:suggested_times].present?
      routed_path = '/event/finish'
    elsif @user.role_type == "Client" && session[:event_id].present?
      routed_path = '/session_details'
    elsif @user.role_type == "Client"
      routed_path = session[:return_to]
      session[:return_to] = nil
    elsif session[:return_to].present?
      routed_path = session[:return_to]
    else
      routed_path = homepage_path
    end
    return routed_path
  end
  
  def find_event_and_client_or_build
    puts 'finding event and client or building'
    if session[:event_id].present?
      puts 'getting event from session'
      @event = Event.find_by(id: session[:event_id])
      @client = check_client_presence_or_build
    elsif params[:event].present?
      puts 'getting event from params'
      @event = Event.find_by(params[:event])
      @client = check_client_presence_or_build
    else
      puts 'neither event params or session exists'
      @client = check_client_presence_or_build
      @event = @client.events.new
    end
    
    check_client_id_equal_event_client_id
    @client.save
    @event.save
    
    if session[:event_id] != @event.id
      puts 'session didnt equal event, reassignign session'
      session[:event_id] = @event.id
    end
  end
  
  def check_client_presence_or_build
    if current_user.present?
      if current_user.role.present? && current_user.role_type = "Client"
        @user = current_user
        @client = @user.role
      elsif current_user.role.nil?
        @user = current_user
        if Client.find_by(id: @event.client_id).present?
          @client = Client.find_by(id: @event.client_id)
          @user.role = @client
        else
          @client = Client.create
          @user.role = @client
        end
      end
      
    elsif current_user.nil?
      if @event.nil?
        @client = Client.create
      else
        @client = Client.find_by(id: @event.client_id)
      end
    end
    return @client
  end
  
  def check_client_id_equal_event_client_id
    if @client.id != @event.client_id
      puts 'event client id not equal to client id, reassigning'
      @event.client_id = @client.id
    end
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
