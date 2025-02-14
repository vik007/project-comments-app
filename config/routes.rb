Rails.application.routes.draw do
  resources :projects do
    resources :comments
  end
  devise_for :users
  root "projects#index"
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  concern :auditable do
    resources :audit_histories, only: :index
  end

  resources :projects, concerns: :auditable
  resources :comments, concerns: :auditable
end
