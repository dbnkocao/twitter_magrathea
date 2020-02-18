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
      url = "#{twitter_api_url}?q=%23#{@hashtag}"
      res = RestClient.get(url, headers: {authorization: "Bearer #{bearer_token}"})
      JSON.parse(res.body)
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end