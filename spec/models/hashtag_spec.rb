require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  it "validate uniquiness of descricao" do
    hashtag1 = create(:hashtag)
    hashtag2 = Hashtag.new(descricao: hashtag1.descricao)

    expect(hashtag2).to_not be_valid
    expect(hashtag2.errors[:descricao]).to include('Já existe essa hashtag.')
  end

  it "validate presence of descricao" do
    hashtag = Hashtag.new(descricao: "")

    expect(hashtag).to_not be_valid
    expect(hashtag.errors[:descricao]).to include('O campo descrição é obrigatório.')
  end

  it "validate if hashtag has any space" do
    hashtag = Hashtag.new(descricao: "  hashtag")

    expect(hashtag).to_not be_valid
    expect(hashtag.errors[:descricao]).to include('Não é permitido usar espaços em branco em uma hashtag.')
  end

  it "validate if hashtag has any only digits and letters" do
    "[!@#$%^&*(),.?\":{}|<>]".each_char do |char|
      hashtag = Hashtag.new(descricao: "#{char}")
      expect(hashtag).to_not be_valid
      expect(hashtag.errors[:descricao]).to include('Uma hashtag deve conter apenas letras e números.')
    end

  end
end
