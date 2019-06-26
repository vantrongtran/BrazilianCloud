Rails.application.routes.draw do
  root to: "clients#index"
  devise_for :users, only: :sessions
  resources :products
  resources :clients

  match "/404", to: "application#not_found", via: :all
  match "/500", to: "application#internal_server_error", via: :all
end
