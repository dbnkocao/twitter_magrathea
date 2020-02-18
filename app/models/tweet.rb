class Tweet < ApplicationRecord

  def self.sync_twitter
    Hashtag.all.each do |hashtag|

      tweets = TwitterService.new(hashtag.descricao).perform

      tweets.each do |tweet|
        new_tweet = Tweet.new
        new_tweet.tweet_id = tweet["id_str"]
        new_tweet.mensagem = tweet["text"]
        new_tweet.autor = tweet["user"]["screen_name"]
        new_tweet.data_publicacao = tweet["created_at"]

        new_tweet.save
      end
    end
  end
end
