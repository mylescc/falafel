Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  get 'talent', to: 'home#talent'

  resources :personal_details, only: [:new, :show, :create, :edit, :update]

  resources :roles, only: [:new, :create]
end
