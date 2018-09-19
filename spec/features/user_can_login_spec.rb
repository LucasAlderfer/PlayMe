require 'rails_helper'

describe 'visiting /' do
  context 'as a visitor' do
    xit 'can login or create account through steam' do
      allow_any_instance_of(SteamUserPresenter).to receive(:get_persona).and_return('Boss')
      allow_any_instance_of(SteamUserPresenter).to receive(:get_rank_tier).and_return('Amazing')
      allow_any_instance_of(SteamUserPresenter).to receive(:get_mmr).and_return('10K')
      allow_any_instance_of(SteamUserPresenter).to receive(:get_avatar).and_return('http://placekitten.com/200/300')
      HeroCreationService.new.make_heroes
      HeroMatchupService.new.update_heroes
      stub_steam_auth

      visit '/'

      click_on 'Steamicon'

      expect(current_path).to eq('/users/1')
      expect(page).to have_content("Steam Id: 123545")
      expect(page).to have_content("Welcome Billy")
      expect(page).to have_content("Rank Tier: Amazing")
      expect(page).to have_content("MMR Estimate: 10K")
      expect(page).to have_content("Currently Playing As: Boss")
    end
  end
end
