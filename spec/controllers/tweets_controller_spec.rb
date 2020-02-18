require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  context '#index' do
    it 'respondes successfully' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
