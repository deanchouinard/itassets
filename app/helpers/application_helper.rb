module ApplicationHelper
  
  def signed_in?
    
  end
  
  def logo
    image_tag("logo.png", :alt => "ITAssets", :class => "round")
  end
  
  # return a title on a per-page basis.
  def title
    base_title = "IT Assets"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
