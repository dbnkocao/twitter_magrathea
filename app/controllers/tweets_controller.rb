class TweetsController < ApplicationController
  def index
    t = TwitterService.new('ruby').perform

    puts t
    @tweets = Tweet.all
  end
end
