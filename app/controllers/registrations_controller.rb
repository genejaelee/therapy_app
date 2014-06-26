class RegistrationsController < Devise::RegistrationsController
  protected
  before_filter :get_return_to
  
  def after_sign_up_path_for(resource)
    puts "user signed up"
    
    @therapist = current_therapist
    if resource.class == Therapist
      puts "signed up user is therapist"
      @therapist.update_attribute(:time_zone, cookies["jstz_time_zone"])
      return update_therapist_path
    end
    
    @client = current_client
    if resource.class == Client
      puts "signed up user is client"
      puts "request referer is #{request.referer}"
      return session[:return_to]
    end
  end
  
  def edit
    which_edit_page
    @therapist = current_therapist
  end
  
  def get_return_to
    session[:return_to] ||= request.referer
  end
end
