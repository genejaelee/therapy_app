class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  around_filter :user_time_zone, :if => :current_user
  helper_method :current_user, :which_edit_page
  before_action :current_user
  
  def after_sign_in_path_for(resource)
    @therapist = current_therapist
  end
  
  def which_edit_page
    if request.path_parameters == { 'action' => 'signup', 'controller' => 'therapists'}
      @edit_page = 'signup'
    elsif request.path_parameters == { 'action' => 'edit', 'controller' => 'registrations'}
      @edit_page = 'edit'
    end
  end
  
  private
  
  def current_user
      @_current_user ||= session[:current_user_id] &&
        User.find_by(id: session[:current_user_id])
  end

  def user_time_zone(&block)
    Time.use_zone(@_current_user.time_zone, &block)
  end
end
