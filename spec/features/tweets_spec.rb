require 'rails_helper'

RSpec.feature "Tweets", type: :feature do
  scenario 'Show index with tweets' do
    tweet1 = create(:tweet)
    tweet2 = create(:tweet)
    
    visit(tweets_path)

    expect(page).to have_content(tweet1.autor).and have_content(tweet2.autor)
    expect(page).to have_content(tweet1.mensagem).and have_content(tweet2.mensagem)
    expect(page).to have_content(tweet1.data_publicacao).and have_content(tweet2.data_publicacao)
  end
end
