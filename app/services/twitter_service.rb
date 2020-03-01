require 'rest-client'
require 'json'

class TwitterService
  def initialize(hashtag, since_id=nil)
    @hashtag = hashtag
    @since_id = since_id
  end
 
  def perform
    begin
      twitter_api_url = Rails.application.credentials[:api_url]
      bearer_token = Rails.application.credentials[:bearer_access_token]
      url = "#{twitter_api_url}?q=%23#{@hashtag}&count=100&result_type=recent&exclude=retweets&exclude=replies&tweet_mode=extended#{@since_id.nil? ? '' : "&since_id=#{@since_id}"}"
      res = RestClient.get(url, {authorization: "Bearer #{bearer_token}"})
      JSON.parse(res.body)["statuses"]
    rescue RestClient::ExceptionWithResponse => e
      puts e.response
      []
    end
  end
end