require 'rails_helper'

describe SteamUserPresenter do
  it 'can get information about a user based on their steam id' do
    user = User.create!(name: 'test', email: 'testemail', steam_id: '76561198053222027', password: 'password')
    steamuser = SteamUserPresenter.new(user)

    expect(steamuser).to respond_to(:name)
    expect(steamuser).to respond_to(:steam_id)
    expect(steamuser).to respond_to(:persona)
    expect(steamuser).to respond_to(:rank_tier)
    expect(steamuser).to respond_to(:mmr)
  end
end
