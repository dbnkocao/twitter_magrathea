require 'rails_helper'

RSpec.feature "Hashtags", type: :feature do
  scenario 'Show index with hashtags' do
    hashtag1 = create(:hashtag)
    hashtag2 = create(:hashtag)
    
    visit(hashtags_path)

    expect(page).to have_content(hashtag1.descricao).and have_content(hashtag2.descricao)
  end

  scenario 'Creating a Hashtag' do
    visit(new_hashtag_path)

    fill_in('Descrição', with: FFaker::Lorem.word)

    click_button('Criar Hashtag')

    expect(page).to have_content('Hashtag criada com sucesso!')
  end

  scenario 'Deleting a Hashtag' do
    hashtag = create(:hashtag)
    visit(hashtags_path)

    click_button('Deletar')
    
    expect(page).to have_content('Hashtag deletada com sucesso!')
  end
end
