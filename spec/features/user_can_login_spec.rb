require 'rails_helper'

describe 'visiting /' do
  context 'as a visitor' do
    it 'can login' do
      user = User.create!(name: 'Billy', steam_id: '76561198053222027', email: 'test', password: 'password')
      visit '/'

      click_on 'Login'

      expect(current_path).to eq(login_path)

      within('.login') do
        fill_in :email, with: user.email
        fill_in :password, with: user.password
        click_on 'Login'
      end

      expect(current_path).to eq(user_path(user))
    end
  end
end
