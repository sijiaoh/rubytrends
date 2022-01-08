Rails.application.routes.draw do
  root "static_pages#home"

  get "compare/:query", to: "compare#index", as: :compare
  get "chart/:query/:period", to: "chart#index", as: :chart
end
