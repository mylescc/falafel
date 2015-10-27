Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  get 'talent', to: 'home#talent'

  resources :personal_details, only: [:new, :show, :create, :edit, :update]
  resource  :experience, only: [:show]
  resources :user_experience_roles, only: [:create]
  resources :user_experience_industries, only: [:create]
  resources :user_experience_management_skills, only: [:create]

  resources :competencies, only: [:index] do
    collection { post :reorder }
  end

  resources :qualifications, only: [:index, :create]
  resources :achievements, only: [:index, :create]
  resources :references, only: [:index, :create] do
    member { post :send_reminder_email }
  end

  controller :roles do
    get   'roles/show'     => :show
    patch 'roles/update'   => :update
  end
end
