module ApplicationHelper

  def full_title(page_title)
    base_title = "EventBrite Clone"
    if !page_title
      base_title
    else
      base_title + " | #{page_title}"
    end
  end

end
