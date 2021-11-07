Rails.application.routes.draw do
  devise_for :users
  get 'reports/index'
  root to: "reports#index"
end
