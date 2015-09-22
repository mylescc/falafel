Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  get 'talent', to: 'talent#index'
end
