require 'rails_helper'

describe 'visiting /settings' do
  context 'as a user' do
    it 'can change its settings' do
      user = User.create(name: 'test', uid: 12345, fun_settings: [1], random_settings: [1])
      Hero.create(name:'Anti-Mage', hero_id:1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_settings_path(user)
      within('.current-fun-settings') do
        expect(page).to have_content('Anti-Mage')
      end

      within('.current-random-settings') do
        expect(page).to have_content('Anti-Mage')
      end
    end
  end
end
