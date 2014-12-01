Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: :registrations }
  root to: "lobby#index"
  resources :users, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :cards, only: [:index]
    end
  end

  get "/deck_builder", to: "deck_builder#index"
end
