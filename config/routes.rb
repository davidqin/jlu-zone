Wiki::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users 

  devise_scope :user do
    get "/login_dialog", :to => "sessions#new"
  end
  
  root :to => 'home#index'

  get "/users/menu" => "users/users#menu", :as => :users
  
  get "campus/:campus" => 'users/users#location', :as => :location_users

  resources :users,  :only => [:show, :index],            :controller => 'users/users' do
    member do
      get :topics
      get :follows
    end
  end
  
  get "/users/:id/notices" => 'users/user_notices#index',         :as => :user_notices
  put "/users/:id/notices" => 'users/user_notices#mark_all_read', :as => :mark_all_notices_read

  put "/notices/:id" => 'users/user_notices#mark_one_read', :as => :mark_one_notices_read
  put "/notices/:id/unread" => 'users/user_notices#mark_one_unread', :as => :mark_one_notices_unread
  delete "/notices/:id" => 'users/user_notices#destroy', :as => :notice_destroy

  scope :path => 'wiki' do
    get  '/'                         => "wiki/wiki#index",     :as => :wiki

    resources :entries, :except => [:index],      :controller => 'wiki/entries' do
      member do
        post :lock
        post :unlock
      end
    end
    get  'category/:category_number' => "wiki/entries#index",  :as => :category_entries
  end

  resources :replies,  :only => [:create, :edit, :update], :controller => 'replies/replies'

  scope :path => 'community' do
    resources :topics, :controller => "community/topics" do
      member do
        post :lock
        post :unlock
        post :move_to_top
        post :cancel_move_to_top
      end
    end
    get  '/'  => "community/community#index",     :as => :community
    get  ':tag_id' => "community/tags#index",     :as => :tag
  end
  
  post "followed_resources" => "followed_resources#create", :as => :follow
  delete "followed_resources" => "followed_resources#destroy", :as => :unfollow

  resources :photos, :controller => 'photos/photos' do
    member do
      post :lock
      post :unlock
    end
  end

  resources :albums, :controller => 'photos/albums'
end