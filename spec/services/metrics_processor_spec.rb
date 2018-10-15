require 'rails_helper'

describe MetricsProcessor do
  it 'can find the pro participation score for each hero' do
    HeroCreationService.new.make_heroes
    mp = MetricsProcessor.new
    mp.make_pro_hash
    expect(mp.pro_hash.keys).to eq(Hero.pluck(:id))
    hero_1 = Hero.first
    expect(hero_1.default_score).to eq(0)
    mp.make_win_hash
    mp.make_hero_scores
    hero_2 = Hero.first
    expect(hero_2.default_score).to_not eq(0)
  end
end
