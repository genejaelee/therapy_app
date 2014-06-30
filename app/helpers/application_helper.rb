module ApplicationHelper
  def page_title(page_title)
    if page_title.nil?
      page_title = "Scouter"
    end
    content_for :page_title, page_title.to_s
  end
  
  def check_presence_and_find_by_id(this_class, id)
    if id.present?
      @object = this_class.find_by(id: id)
      return @object
    else
      puts "couldn't find id"
    end
  end
  
  def get_a_event_for_user
    event = check_presence_and_find_by_id(Event, session[:event_id])
    if event.nil?
      event = current_user.build_event
    end
    return event
  end
  
  def get_therapist_for_user
    therapist = check_presence_and_find_by_id(Therapist, session[:event][:therapist_id])
    if therapist.nil?
      therapist = current_user.build_therapist
    end
    return therapist
  end
end
