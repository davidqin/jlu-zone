Wiki::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users do
    get "/login_dialog", :to => "sessions#new"
  end

  root :to => 'home#index'

  get "/users/menu" => "users/users#menu", :as => :users

  resources :users,  :only => [:show, :index],            :controller => 'users/users'
  get "/users/:id/notices" => 'users/user_notices#index',         :as => :user_notices
  put "/users/:id/notices" => 'users/user_notices#mark_all_read', :as => :mark_all_notices_read

  put "/notices/:id" => 'users/user_notices#mark_one_read', :as => :mark_one_notices_read
  put "/notices/:id/unread" => 'users/user_notices#mark_one_unread', :as => :mark_one_notices_unread
  delete "/notices/:id" => 'users/user_notices#destroy', :as => :notice_destroy

  scope :path => 'wiki' do
    get  '/'                         => "wiki/wiki#index",     :as => :wiki

    resources :entries, :except => [:index],      :controller => 'wiki/entries'
    get  'category/:category_number' => "wiki/entries#index",  :as => :category_entries
  end

  resources :replies,  :only => [:create, :edit, :update], :controller => 'replies/replies'

  scope :path => 'community' do
    get  '/'  => "community/community#index",     :as => :community

    resources :topics, :controller => "community/topics"
  end
end