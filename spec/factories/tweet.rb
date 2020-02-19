FactoryBot.define do
  factory :tweet do
    tweet_id { rand(1..99999) }
    autor { FFaker::Name.first_name }
    mensagem { FFaker::Tweet.tweet }
    data_publicacao { FFaker::Time.date }
  end
end