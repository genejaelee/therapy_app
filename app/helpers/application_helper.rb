module ApplicationHelper
  def page_title(page_title)
    if page_title.nil?
      page_title = "Scouter"
    end
    content_for :page_title, page_title.to_s
  end
end
