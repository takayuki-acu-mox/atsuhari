Rails.application.routes.draw do
  root to: 'therapies#index'
  resources :therapies, only: :index
end
