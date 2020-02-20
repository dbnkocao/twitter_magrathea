class TweetsController < ApplicationController
  def index
    @hashtags = Hashtag.all
    @tweets = Tweet.paginate(page: params[:page], per_page: 30)
  end
end
