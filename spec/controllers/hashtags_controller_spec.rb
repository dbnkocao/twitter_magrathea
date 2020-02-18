require 'rails_helper'

RSpec.describe HashtagsController, type: :controller do
  context '#index' do
    it 'respondes successfully' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  context '#create' do
    it 'with valid attributes' do
      hashtag_params = attributes_for(:hashtag)
      expect{
        post :create, params: { hashtag: hashtag_params }
      }.to change(Hashtag, :count).by(1)
    end
  end

  context '#destroy' do
    it 'must destroy hashtag' do
      hashtag = create(:hashtag)
      expect{
        delete :destroy, params: {id: hashtag.id}
      }.to change(Hashtag, :count).by(-1)
    end
  end
end
