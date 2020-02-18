require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before :each do
    @hashtag = create(:hashtag)
    

      
    stub_request(:get, /api.twitter.com/ )
    .with(headers: {
      'Accept'=>'*/*'
    }).to_return(status: 200, body: "
      {
        \"statuses\": [
          {
            \"created_at\": \"Mon May 06 20:01:29 +0000 2019\",
            \"id\": 1125490788736032770,
            \"id_str\": \"1125490788736032770\",
            \"text\": \"#{FFaker::Lorem.sentence}\",
            \"entities\": {
              \"hashtags\": [\"#{@hashtag.descricao}\"]
            },
            \"user\": {
              \"id\": 2244994945,
              \"id_str\": \"2244994945\",
              \"name\": \"Twitter Dev\",
              \"screen_name\": \"TwitterDev\"
            }
          }
        ]
      }

      ", headers: {})
  end

  context "#sync_tweeter" do
    it "should create one tweet with hashtag" do
       expect{
         Tweet::sync_twitter
       }.to change(Tweet, :count).by(1)
    end
  end
end
