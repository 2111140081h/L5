Rails.application.routes.draw do
  get 'tweet/index'
  get 'tweet/new'
  get 'tweet/create'
  get 'tweet/destroy'
  get 'top/main'
  get 'top/login'
  get 'top/logout'
  get 'top/failed'
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/destroy'
  get 'tweets/index'
  get 'tweets/new'
  get 'tweets/create'
  get 'tweets/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :tweet
  resources :top
  post 'users/create'
  root 'users#index'
  get 'top/main'
  post 'top/login'
  post 'top/logout'
  get 'top/logout'
  post 'tweet/create'
  # root 'tweets#index'
end
