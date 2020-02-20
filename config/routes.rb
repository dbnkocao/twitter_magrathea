Rails.application.routes.draw do
  resources :hashtags, only: [:index, :create, :destroy, :new]
  resources :tweets, only: [:index]
  get '/get_tweets', to: 'tweets#get_tweets'
  root to: "tweets#index"
end