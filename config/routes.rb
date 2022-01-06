Rails.application.routes.draw do
  root "home#index"

  get "sign_in", to: "session#new"
  get "sign_up", to: "users#new"
  delete "sign_out", to: "session#destroy"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users, only: [:index, :show, :create]
  get "compare/:query", to: "compare#index", as: :compare
  get "chart/:query/:since", to: "chart#index", as: :chart
end
