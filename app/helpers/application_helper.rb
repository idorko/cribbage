module ApplicationHelper

	#return title on per-page basis
	def title
		base_title = "Web Cribbage App"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
	
	def logo
		image_tag("logo.png", :alt=> "Web Cribbage", :class => "round") 
	end
end
