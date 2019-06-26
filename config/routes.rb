Rails.application.routes.draw do
  devise_for :users, only: :sessions
  resources :products

  match "/404", to: "application#not_found", via: :all
  match "/500", to: "application#internal_server_error", via: :all
end
