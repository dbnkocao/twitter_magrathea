Rails.application.routes.draw do
  resources :hashtags, only: [:index, :create, :destroy]
  resources :tweets, only: [:index]
end