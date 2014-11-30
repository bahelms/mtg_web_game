Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: :registrations }
  root to: "lobby#index"
  resources :users, only: [:show]

  get "/deck_builder", to: "deck_builder#index"
end
