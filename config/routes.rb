Rails.application.routes.draw do

  devise_for :users
  root to: "therapies#index"

  resources :therapies, only: [:index, :new, :create]
end
