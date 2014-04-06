module ApplicationHelper
	def page_title
		@page_title || "Temperatureviewer"
	end

	def footer
		@footer || 'Copyright of Katherine Navarrete, 2014'
	end
end
