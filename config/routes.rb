Rails.application.routes.draw do
  root 'sessions#index'  # You need to create a welcome controller and index action/view

  get    'signup', to: 'users#new',    as: 'signup'
  post   'users',  to: 'users#create'

  get    'login',  to: 'sessions#new',     as: 'login'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :messages
  resources :chat_users
  resources :chats
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
