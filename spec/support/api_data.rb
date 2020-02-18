RSpec.configure do |config|
  config.before(:each) do   
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
              \"hashtags\": [\"#{FFaker::Lorem.word}\"]
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
end