require 'rails_helper'

describe Hero do
  it 'can determine first_pick_percent and first_win_percent' do
    hero = Hero.new(one_pick: 16, two_pick: 21, three_pick: 21, four_pick: 21, five_pick: 21, one_win: 4)

    expect(hero.first_pick_percent).to eq(16.0)
    expect(hero.first_win_percent).to eq(25.0)
  end
end
