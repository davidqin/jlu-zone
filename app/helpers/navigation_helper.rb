module NavigationHelper
	def user_navigation
		dialog_url = login_path
		url = register_path
		content_tag :div, :id => :user_navigation do
			contents_tag :ul, :class => :nav do |contents|
				if current_user
				else
					contents << content_tag(:li) do
						content_tag(:a, itext('login'), :dialog_url => "#{dialog_url}", :id => :login, "data-toggle" => "modal")
					end
					contents << content_tag(:li) do
						content_tag(:a, itext('register'), :href => "#{url}")
					end
				end
			end
		end
	end
end