Wiki::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users
  #devise_for :users, :path => "/users", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }

  #devise_scope :users do
  #  get "sign_in", :to => "users/users#new"
  #end
  
  #resources :users, :only => :index

	root :to        => 'wiki#index'
	#get  'register' => 'users/users#new'
	#post 'register' => 'users/users#create'
	#get  'login'    => 'users/sessions#new'
	#post 'login'    => 'users/sessions#create'
	#get  'logout'   => 'users/sessions#destroy'	
end
