Rails.application.routes.draw do
  resources :hashtags, only: [:index, :create, :destroy]
end
