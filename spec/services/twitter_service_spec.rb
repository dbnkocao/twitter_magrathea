require 'spec_helper'
require 'json'
require './app/services/twitter_service'
 
describe 'Twitter' do
  it 'must return a valid array from tweets' do
    since_id = rand(0..9999)
    hashtag = "##{FFaker::Lorem.word}"
    res = TwitterService.new(hashtag, since_id).perform['statuses'][0]

    expect(res["created_at"]).to be_present
    expect(res["text"]).to be_present
    expect(res["user"]["screen_name"]).to be_present
    expect(res["id"]).to be_present
  end
end