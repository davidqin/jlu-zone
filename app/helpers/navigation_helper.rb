module NavigationHelper
	def user_navigation
		content_tag :div, :id => :user_navigation do
			contents_tag :ul, :class => :nav do |contents|
				if current_user
				else
				end
			end
		end
	end
end