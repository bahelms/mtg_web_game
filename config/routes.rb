Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: :registrations }
  root to: "lobby#index"
  resources :users, only: [:show]
end
