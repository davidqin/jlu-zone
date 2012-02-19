Wiki::Application.routes.draw do
  root :to => 'wiki#index'

  get  'login'  => 'users/sessions#new'
  post 'login'  => 'users/sessions#create'
  get  'logout' => 'users/sessions#destroy'
  
end
