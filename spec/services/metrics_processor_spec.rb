require 'rails_helper'

describe MetricsProcessor do
  it 'can find the top half of all heroes by pro participation' do
    HeroCreationService.new.make_heroes
    mp = MetricsProcessor.new
    expect(mp.pro_picks.class).to eq(Array)
    expect(mp.pro_picks.first.class).to eq(Hero)
    expect(mp.pro_picks.count).to eq(58)
  end
end
