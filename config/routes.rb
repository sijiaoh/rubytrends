Rails.application.routes.draw do
  root "static_pages#home"

  get "sign_in", to: "sessions#new"
  get "sign_up", to: "users#new"
  delete "sign_out", to: "sessions#destroy"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users, param: :hashid, only: %i[index show create]
  resources :posts, param: :hashid
end
