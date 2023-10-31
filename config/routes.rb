Rails.application.routes.draw do
  get 'top/main'
  get 'top/login'
  get 'top/logout'
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :tweets
  post 'users/create'
  root 'users#index'
  post 'top/login'
  get 'top/logout'
  # root 'tweets#index'
end
