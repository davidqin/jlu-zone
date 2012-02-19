module NavigationHelper
	def user_navigation
		return unless current_user
		content_tag :div, :id => :user_navigation do
			contents_tag :ul, :class => :nav do |contents|
				contents << user_choose_company_navigation
				contents << user_company_list_navigation
				contents << user_account_navigation
				contents << user_logout_navigation
			end
		end    
	end
end