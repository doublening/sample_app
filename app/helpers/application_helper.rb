module ApplicationHelper
  #Returnatitleonaper-pagebasis.
  def title
	base_title= "Ruby on Rails Tutorial Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{h(@title)}"
    end
  end
end