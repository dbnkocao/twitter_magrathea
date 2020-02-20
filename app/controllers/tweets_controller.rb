class TweetsController < ApplicationController
  def index
    @hashtags = Hashtag.all
    @tweets = Tweet::tweets_by_hashtags(@hashtags).paginate(page: params[:page], per_page: 30)
  end

  def get_tweets
    hashtags = Hashtag.where(descricao: params[:hashtag])
    @tweets = Tweet::tweets_by_hashtags(hashtags).paginate(page: params[:page], per_page: 30)
    render partial: 'tweets'
  end
end
