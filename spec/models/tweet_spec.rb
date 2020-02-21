require 'rails_helper'

RSpec.describe Tweet, type: :model do
  
  context "#sync_tweeter" do
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
              \"full_text\": \"#{@text}\",
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

    it "should create one tweet" do
      expect{
        Tweet::sync_twitter_without_delay
      }.to change(Tweet, :count).by(1)
    end

    describe "should save correct attributes" do
      before :each do
        Tweet::sync_twitter_without_delay
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

  context "#tweets_by_hashtags" do
    it "should return a tweet that has hashtag" do
      hashtag = create(:hashtag)
      tweet = create(:tweet, hashtags: [hashtag.descricao])

      expect(Tweet::tweets_by_hashtags([hashtag])).to include(tweet)

    end

    it "should not return a tweet that does not hav hashtag" do
      hashtag1 = create(:hashtag)
      tweet1 = create(:tweet, hashtags: [hashtag1.descricao])

      hashtag2 = create(:hashtag)
      tweet2 = create(:tweet, hashtags: [hashtag2.descricao])

      expect(Tweet::tweets_by_hashtags([hashtag2])).to include(tweet2)
      expect(Tweet::tweets_by_hashtags([hashtag2])).to_not include(tweet1)
    end

    it "should return a empty array if no hashtag given" do
      hashtag = create(:hashtag)
      tweet = create(:tweet, hashtags: [hashtag.descricao])

      expect(Tweet::tweets_by_hashtags([])).to eq([])
      
    end
  end

  it "validate uniquiness tweet_id" do
    tweet1 = create(:tweet)
    tweet2 = Tweet.new(attributes_for(:tweet))
    tweet2.tweet_id = tweet1.tweet_id

    expect(tweet2).to_not be_valid
    expect(tweet2.errors[:tweet_id]).to include('Tweet já cadastrado.')
  end

end
 