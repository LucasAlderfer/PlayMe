require 'rails_helper'

describe SteamUserPresenter do
  it 'can get information about a user based on their steam id' do
    user = User.create!(name: 'test', uid: '76561198053222027')
    HeroCreationService.new.make_heroes
    MetricsProcessor.new.make_hero_scores
    steamuser = SteamUserPresenter.new(user)
    expect(steamuser).to respond_to(:name)
    expect(steamuser).to respond_to(:steam_id)
    expect(steamuser).to respond_to(:persona)
    expect(steamuser).to respond_to(:rank_tier)
    expect(steamuser).to respond_to(:mmr)
    expect(steamuser).to respond_to(:fun_heroes)
    expect(steamuser).to respond_to(:top_heroes)
    expect(steamuser).to respond_to(:random_heroes)
    expect(steamuser.top_heroes.count).to eq(10)
  end
end
