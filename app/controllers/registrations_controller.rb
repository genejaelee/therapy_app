class RegistrationsController < Devise::RegistrationsController
  protected
  before_filter :get_return_to
  
  def after_sign_up_path_for(resource)
    puts "user signed up"
    @user = current_user
    
    if @user.role_type == "Therapist"
      puts "signed up user is therapist"
      @user.role = Therapist.create(params[:therapist])
      @user.save
      return update_therapist_path
    end
    
    if @user.role_type == "Client" && session[:event].present?
      puts "signed in user is client, return finish event"
      return '/event/finish'
    else
      return homepage_path
    end
  end
  
  def edit
    @therapist = current_user.role
    @client = current_user.role
  end
  
  def get_return_to
    session[:return_to] ||= request.referer
  end
end
