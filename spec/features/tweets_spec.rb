require 'rails_helper'

RSpec.feature "Tweets", type: :feature do
  scenario 'Show index with tweets' do
    hashtag = create(:hashtag)
    tweet1 = create(:tweet, hashtags: [hashtag.descricao])
    tweet2 = create(:tweet, hashtags: [hashtag.descricao])
    
    visit(tweets_path)

    expect(page).to have_content(tweet1.autor).and have_content(tweet2.autor)
    expect(page).to have_content(tweet1.mensagem).and have_content(tweet2.mensagem)
    expect(page).to have_content(tweet1.data_publicacao.strftime("%d/%m/%Y %H:%M:%S")).and have_content(tweet2.data_publicacao.strftime("%d/%m/%Y %H:%M:%S"))
  end
end
