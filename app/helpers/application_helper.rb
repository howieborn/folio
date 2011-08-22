module ApplicationHelper
  # Return a title on a per-page basis.
  def title
    base_title = "@ Howie Born"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  # Return a title on a per-page basis.
  def heading
    base_heading = "Web Design"
    if @heading.nil?
      base_heading
    else
      "#{base_heading} | #{@heading}"
    end
  end
  
  def is_active?(page_name)
    return 'active' if request.request_uri == page_name
    ''
  end
  


end
