Rails.application.routes.draw do
  get 'users/index'

  resources :posts
  devise_for :users

  root to: 'home#index'
end
