Rails.application.routes.draw do
  resources :profiles
  resources :posts

  get 'profiles/index'
  get 'posts/index'
  get 'users/index'

  namespace :api do
    resources :profiles, only: [:index, :create, :update, :destroy] do
      collection do
        get :search
      end
    end

    resources :posts, only: [:index, :create, :update, :destroy] do
      collection do
        get :search
        put :follow
      end
    end
  end

  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'posts#index'
end
