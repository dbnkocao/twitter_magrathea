Rails.application.routes.draw do
  resources :hashtags, only: [:index, :create, :destroy, :new]
  resources :tweets, only: [:index]
end