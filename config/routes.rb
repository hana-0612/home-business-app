Rails.application.routes.draw do
  devise_for :users
  get 'reports/index'
  root to: "reports#index"
  resources :users, only: [:edit, :update]
  resources :reports, only: [:index, :new, :create]
end
