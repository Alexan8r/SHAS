Rails.application.routes.draw do
  resources :distributions
  root to: 'distributions#index'
end
