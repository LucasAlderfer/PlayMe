require 'rails_helper'

describe UserHero do
  it 'can determine win rate, win-loss, and last_played' do
    hero = { 'hero_id' => 1, 'games' => 10, 'win' => 5, 'last_played' => 1537338635}
    userhero = UserHero.new(hero)
    expect(userhero.win_rate).to eq(50.0)
    expect(userhero.win_loss).to eq('5 wins and 5 losses over 10 total games.')
    expect(userhero.last_played.to_date.to_s).to eq('2018-09-19')
  end
end
