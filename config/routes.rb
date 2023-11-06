Rails.application.routes.draw do
  get 'top/main'
  get 'top/login'
  post 'top/login'
  get 'top/logout'

  resources :users
  resources :tweet
  resources :likes, only: [:create, :destroy]

  root 'users#index'
end
