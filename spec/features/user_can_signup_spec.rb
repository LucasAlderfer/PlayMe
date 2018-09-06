require 'rails_helper'

describe 'visiting /' do
  context 'as a visitor' do
    it 'can click on sign up and create a new account from the new account page' do
      allow_any_instance_of(User).to receive(:id).and_return(1)
      visit '/'

      click_on 'Sign Up!'

      expect(current_path).to eq(new_user_path)

      fill_in :user_name, with: 'test'
      fill_in :user_steam_id, with: '1234567'
      fill_in :user_email, with: 'test@test.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'

      click_on 'Create User'

      expect(current_path).to eq('/users/1')
      expect(page).to have_content('Welcome test!')
      expect(page).to have_content('Steam Id: 1234567')
    end
  end
end
