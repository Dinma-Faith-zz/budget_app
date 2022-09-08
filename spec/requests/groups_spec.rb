require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  describe 'GET #index' do
    let(:user) do
      User.create!(name: 'Faith', email: 'example@gmail.com', password: 123456)
    end

    before(:example) { get user_groups_path(user, user.groups) }

    it 'renders correct page contents' do
      expect(response.body).to include('You need to sign in or sign up before continuing')
    end
  end
end