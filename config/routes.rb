Rails.application.routes.draw do
  devise_for :users

  default_url_options Rails.application.config.action_controller.default_url_options

  root 'home#index'

  get 'talent', to: 'home#talent'

  resources :personal_details, only: [:new, :show, :create, :edit, :update]
  resource  :experience, only: [:show]
  resources :user_experience_roles, only: [:create, :destroy]
  resources :user_experience_industries, only: [:create, :destroy]
  resources :user_experience_management_skills, only: [:create, :destroy]
  resources :user_experience_methods, only: [:create, :destroy]
  resources :user_experience_applications, only: [:create, :destroy]
  resources :user_experience_languages, only: [:create, :destroy]
  resources :user_experience_infrastructures, only: [:create, :destroy]

  resources :competencies, only: [:index, :destroy] do
    collection { post :save_list }
  end

  resources :qualifications, only: [:index, :create, :destroy]
  resources :achievements, only: [:index, :create, :destroy]
  resources :references, only: [:index, :create, :destroy, :show] do
    member { post :send_reminder_email }
  end

  get 'submit_reference/:guid' => 'references#edit', :as => 'edit_reference'
  # patch 'submit_reference/:guid' => 'references#update', :as => 'update_reference'
  resources :user_experience_references,only: [:create, :update]

  resources :video_statements, only: [:index, :create, :destroy]

  resource :validate_profile, only: [:show]

  controller :roles do
    get   'roles/show'     => :show
    patch 'roles/update'   => :update
  end
end
