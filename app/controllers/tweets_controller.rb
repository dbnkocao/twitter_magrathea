class TweetsController < ApplicationController
  def index
    @options_hashtags = Hashtag.all

    if params[:hashtag].present?
      @hashtag = Hashtag.find(params[:hashtag])
      hashtags = [@hashtag]
    else
      hashtags = Hashtag.all
    end

    @tweets = Tweet::tweets_by_hashtags(hashtags).paginate(page: params[:page], per_page: 30)
  end
end
