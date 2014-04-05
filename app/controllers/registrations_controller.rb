class RegistrationsController < Devise::RegistrationsController
  protected
  
  def after_sign_up_path_for(resource)
    return update_therapist_path
  end
  
  def edit
    which_edit_page
    @therapist = current_therapist
  end
end
