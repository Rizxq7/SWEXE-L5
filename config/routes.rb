Rails.application.routes.draw do
  get "users/index"
  get "users/new"
  root 'top#main'

  resources :users, only: [:index, :new, :create, :destroy]
  resources :tweets, only: [:create]
  resources :likes, only: [:create, :destroy]

  get  'top/main',   to: 'top#main'
  post 'top/login',  to: 'top#login'
  get  'top/logout', to: 'top#logout'
end