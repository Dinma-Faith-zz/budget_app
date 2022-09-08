require 'rails_helper'

RSpec.describe 'Hello world', type: :feature do
  describe 'index page' do
    let(:user) do
      User.create!(name: 'Faith', email: 'faith@gmail.com', password: 123_456)
    end

    let(:records) do
      Record.create!(user:, name: 'record name', amount: 30)
    end

    it 'shows the right content' do
      visit user_records_path(user, user.groups)
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end

    it 'shows the right content' do
      visit user_records_path(user, user.groups)
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end
  end
end
