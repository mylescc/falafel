Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  get 'talent', to: 'home#talent'

  resources :personal_details, only: [:new, :show, :create, :edit, :update]

  controller :roles do
    get   'roles/show'     => :show
    patch 'roles/update'   => :update
  end
end
