Rails.application.routes.draw do
  get 'reports/index'
  root to: "reports#index"
end
