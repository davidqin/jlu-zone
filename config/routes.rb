Wiki::Application.routes.draw do

  root :to => 'home#index'
  get "/about" => 'home#about', :as => :about
  get "/search" => "search#index", :as => :search

  ## routes for admin
  scope :path => "/admin", :as => :admin do
    get "/"        => "admin/admin#index",   :as => :index
    get "/users"   => "admin/admin#users",   :as => :users
    get "/tags"    => "admin/admin#tags",    :as => :tags
    get "/topics"  => "admin/admin#topics",  :as => :topics
    get "/entries" => "admin/admin#entries", :as => :entries
    resources :tags, :except => [:index ,:show]
  end

  ## routes for users
  devise_for :users, :controllers => {:sessions => "sessions", :registrations => "registrations"}

  get "/users/menu" => "users/users#menu", :as => :users
  get "campus/:campus" => 'users/users#location', :as => :location_users
  
  resources :users,  :only => [:show, :index],            :controller => 'users/users' do
    member do
      post :lock
      post :unlock
      get :topics
      get :follows
    end
  end
  post   "/users/:id" => 'users/users#set_permission',    :as => :set_user_permission
  delete "/users/:id" => 'users/users#cancel_permission', :as => :cancel_user_permission
  
  get "/users/:id/notices" => 'users/user_notices#index',         :as => :user_notices
  put "/users/:id/notices" => 'users/user_notices#mark_all_read', :as => :mark_all_notices_read

  put "/notices/:id" => 'users/user_notices#mark_one_read', :as => :mark_one_notices_read
  put "/notices/:id/unread" => 'users/user_notices#mark_one_unread', :as => :mark_one_notices_unread
  delete "/notices/:id" => 'users/user_notices#destroy', :as => :notice_destroy

  #routes for wiki
  scope :path => 'wiki' do
    get  '/'                         => "wiki/entries#index",     :as => :wiki
    resources :entries, :controller => 'wiki/entries' do
      member do
        post :lock
        post :unlock
      end
    end
  end

  #routes for replies
  resources :replies,  :only => [:create, :edit, :update], :controller => 'replies/replies'

  #routes for community
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
  
  #routes for followed_resources and liked_resources
  post "followed_resources" => "followed_resources#create", :as => :follow
  delete "followed_resources" => "followed_resources#destroy", :as => :unfollow

  post "liked_resources" => "liked_resources#create", :as => :like
  delete "liked_resources" => "liked_resources#destroy", :as => :unlike

  #routes for photos
  resources :photos, :controller => 'photos/photos' do
    member do
      post :lock
      post :unlock
    end
  end
  get '/recent_photos' => 'photos/photos#recent_photos', :as => :recent_photos
  resources :albums, :controller => 'photos/albums'
end