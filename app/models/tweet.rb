class Tweet < ApplicationRecord

  def self.sync_twitter
    Hashtag.all.each do |hashtag|

      tweets = TwitterService.new(hashtag.descricao).perform

      tweets.each do |tweet|
        new_tweet = Tweet.new
        new_tweet.tweet_id = tweet["id_str"]
        new_tweet.mensagem = tweet["full_text"]
        new_tweet.autor = tweet["user"]["screen_name"]
        new_tweet.data_publicacao = tweet["created_at"]
        new_tweet.hashtags = tweet["entities"]["hashtags"].map {|hashtag| hashtag["text"]}
        
        new_tweet.save

      end
    end
  end

  def self.tweets_by_hashtags(hashtags)
    if hashtags.present?
      hashtags = hashtags.map {|h| "'#{h.descricao.downcase}'" }.join(',')
    else
      hashtags = "''"
    end

    Tweet.where("array[#{hashtags}] && string_to_array(lower(array_to_string(hashtags, ',')),',')")
  end
end
