Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  get 'talent', to: 'home#talent'

  resources :personal_details, only: [:new, :show, :create, :edit, :update]
  resource  :experience, only: [:show]
  resources :user_experience_roles, only: [:create, :destroy]
  resources :user_experience_industries, only: [:create, :destroy]
  resources :user_experience_management_skills, only: [:create, :destroy]
  resources :user_experience_methods, only: [:create, :destroy]

  resources :competencies, only: [:index] do
    collection { post :reorder }
  end

  resources :qualifications, only: [:index, :create, :destroy]
  resources :achievements, only: [:index, :create, :destroy]
  resources :references, only: [:index, :create] do
    member { post :send_reminder_email }
  end
  resource :video_statement, only: [:show, :create]

  controller :roles do
    get   'roles/show'     => :show
    patch 'roles/update'   => :update
  end
end
