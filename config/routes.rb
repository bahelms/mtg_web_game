Rails.application.routes.draw do
  devise_for :users
  root to: "lobby#index"
  resources :users, only: [:show]
end
