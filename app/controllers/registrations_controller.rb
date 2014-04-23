class RegistrationsController < Devise::RegistrationsController
  protected
  
  def after_sign_up_path_for(resource)
    @therapist = current_therapist
    puts "current therapist email is #{@therapist.email}"
    @therapist.update_attribute(:time_zone, cookies["jstz_time_zone"])
    return update_therapist_path
  end
  
  def edit
    which_edit_page
    @therapist = current_therapist
  end
end
