Rails.application.routes.draw do
<<<<<<< Updated upstream
  root 'items#index'
  resources :users, only: [:index, :edit, :update]
  devise_for :users

  resources :items, only: [:index, :show, :new]
  resources :send_informations, only: [:new, :edit, :update]
=======
  resources :users, only: [:edit, :update]
  devise_for :users
  resources :items, only: [:index, :show]
  resources :send_informations, only: [:new, :edit, :update]
  root 'items#index'
  resources :items do
    member do
      get 'buy'
    end
  end
>>>>>>> Stashed changes
end

