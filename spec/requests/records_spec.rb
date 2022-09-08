require 'rails_helper'

RSpec.describe 'Recipe', type: :request do
  describe 'GET #index' do
    let(:user) do
      User.create!(name: 'Faith', email: 'example@gmail.com', password: 123_456)
    end
    let(:records) do
      Record.create!(name: 'Paint', amount: 40)
    end

    before(:example) { get user_records_path(user, user.records) }

    it 'renders correct page contents' do
      expect(response.body).to include('You need to sign in or sign up before continuing')
    end
  end
end
