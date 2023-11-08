Rails.application.routes.draw do
  get 'products/index'
  get 'products/new'
  get 'products/create'
  get 'products/destroy'
  get 'top/main'
  get 'top/login'
  post 'top/login'
  get 'top/logout'
  post 'users/create'
  post 'tweet/create'
  
  resources :users
  resources :tweet
  resources :likes, only: [:create, :destroy]

  root 'users#index'
end
