require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before :each do
    @hashtag = create(:hashtag)
    @text = FFaker::Tweet.tweet
    @id = rand(1..999999).to_s
    @autor = FFaker::Name.first_name

    stub_request(:get, /api.twitter.com/ )
    .with(headers: {
      'Accept'=>'*/*'
    }).to_return(status: 200, body: "
      {
        \"statuses\": [
          {
            \"created_at\": \"Mon May 06 20:01:29 +0000 2019\",
            \"id\": #{@id},
            \"id_str\": \"#{@id}\",
            \"text\": \"#{@text}\",
            \"entities\": {
              \"hashtags\": [{\"text\":\"#{@hashtag.descricao}\",\"indices\":[83,93]},{\"text\":\"health\",\"indices\":[105,112]}]
            },
            \"user\": {
              \"id\": 2244994945,
              \"id_str\": \"2244994945\",
              \"name\": \"Twitter Dev\",
              \"screen_name\": \"#{@autor}\"
            }
          }
        ]
      }

      ", headers: {})
  end

  context "#sync_tweeter" do

    it "should create one tweet" do
      expect{
        Tweet::sync_twitter
      }.to change(Tweet, :count).by(1)
    end

    describe "should save correct attributes" do
      before :each do
        Tweet::sync_twitter
        @tweet = Tweet.last
      end

      it "mensage" do
        expect(@tweet.mensagem).to eq @text
      end

      it "tweet_id" do
        expect(@tweet.tweet_id).to eq @id
      end

      it "autor" do
        expect(@tweet.autor).to eq @autor
      end

      it "hashtag" do
        expect(@tweet.hashtags).to include @hashtag.descricao
      end


    end
  end
end
 