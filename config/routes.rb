Rails.application.routes.draw do
  root "home#index"
  get "sign_in", to: "sign_in#index"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users, only: [:index, :show, :new, :create]
end
