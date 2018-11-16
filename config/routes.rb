Rails.application.routes.draw do
  root to: 'users#index'
  get '/search', to: 'hashtags#search', as: 'search'
  resources :hashtags
  get '/search_result', to: 'hashtags#search_result', as: 'search_result'
  resources :hashtags
  post '/users/:user_id/pictures/:picture_id/likes/:icon_id', to: 'likes#create'
  get '/index', to: 'application#index'
  get '/users', to: 'users#redirect', as: 'redirect'
  resources :sessions, only: [:new, :create]
  delete '/sessions', to: 'sessions#destroy', as: 'destroy_session'
  get'/users/discover', to: 'users#discover', as: 'discover'
  get '/users/:id/followers', to: 'users#followers', as: "followers"
  get '/users/:id/followees', to: 'users#followees', as: "followees"

  get '/users/index', to: 'users#index'
  get '/users/login', to: 'users#login'
  get '/users/signup', to: 'users#signup'
  post '/users/check_user', to: 'users#check_user'

  # get '/users/user_information', to: 'users#user_information', as: 'info'
  resources :users do
    post '/followings', to: 'followings#create', as: 'create_following'
    delete '/followings', to: 'followings#destroy', as: 'unfollow'
    resources :pictures do
      resources :comments
      post '/likes', to: 'likes#create', as: 'create_like'
      resources :likes

    end
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
