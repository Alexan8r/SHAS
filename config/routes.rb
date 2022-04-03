Rails.application.routes.draw do
  resources :versions, only: :index
  resources :messages, only: :index
  resources :distributions, except: :show
  root to: 'distributions#index'
end
