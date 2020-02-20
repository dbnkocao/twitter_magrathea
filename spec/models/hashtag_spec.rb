require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  it "validate uniquiness of descricao" do
    hashtag1 = create(:hashtag)
    hashtag2 = Hashtag.new(descricao: hashtag1.descricao)

    expect(hashtag2).to_not be_valid
    expect(hashtag2.errors[:descricao]).to include('Já existe essa hashtag.')
  end
end
