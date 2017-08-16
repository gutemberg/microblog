Rails.application.routes.draw do
  resources :profiles
  get 'users/index'

  resources :posts
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'posts#index'
end
