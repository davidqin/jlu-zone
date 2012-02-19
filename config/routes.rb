Wiki::Application.routes.draw do
	root :to        => 'wiki#index'
	get  'register' => 'users/users#new'
	post 'register' => 'users/users#create'
	get  'login'    => 'users/sessions#new'
	post 'login'    => 'users/sessions#create'
	get  'logout'   => 'users/sessions#destroy'	
end
