Rails.application.routes.draw do
  resources :profiles
  get 'profiles/index'

  namespace :api do
    resources :profiles, only: [:index, :create, :update, :destroy] do
      collection do
        get :search
      end
    end
  end

  get 'users/index'

  resources :posts
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'posts#index'
end
