class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter { response.headers['P3P'] = %q|CP="HONK"| }
  protect_from_forgery with: :exception
  around_filter :client_time_zone, :if => :current_client
  around_filter :therapist_time_zone, :if => :current_therapist
  helper_method :which_edit_page
  
  def which_edit_page
    if request.path_parameters == { 'action' => 'signup', 'controller' => 'therapists'}
      @edit_page = 'signup'
    elsif request.path_parameters == { 'action' => 'edit', 'controller' => 'registrations'}
      @edit_page = 'edit'
    end
  end
  
  def after_sign_in_path_for(resource)
    @therapist = current_therapist
    @client = current_client
    puts "request referer is #{request.referer}"
    return request.referer
  end
  
  private
  
  #def current_client
  #    @_current_client ||= session[:current_client_id] &&
  #      Client.find_by(id: session[:current_client_id])
  #end

  def client_time_zone(&block)
    Time.use_zone(current_client.time_zone, &block)
  end
  
  def therapist_time_zone(&block)
    puts "getting time zone of therapist"
    Time.use_zone(current_therapist.time_zone, &block)
  end
end
