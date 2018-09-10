require 'rails_helper'

describe Hero do
  it 'can determine first_pick_percent and first_win_percent' do
    hero = Hero.new(one_pick: 16, two_pick: 21, three_pick: 21, four_pick: 21, five_pick: 21, one_win: 4)

    expect(hero.first_pick_percent).to eq(16.0)
    expect(hero.first_win_percent).to eq(25.0)
  end
  it 'can determine second_pick_percent and second_win_percent' do
    hero = Hero.new(one_pick: 21, two_pick: 16, three_pick: 21, four_pick: 21, five_pick: 21, two_win: 4)

    expect(hero.second_pick_percent).to eq(16.0)
    expect(hero.second_win_percent).to eq(25.0)
  end
  it 'can determine third_pick_percent and third_win_percent' do
    hero = Hero.new(one_pick: 21, two_pick: 21, three_pick: 16, four_pick: 21, five_pick: 21, three_win: 4)

    expect(hero.third_pick_percent).to eq(16.0)
    expect(hero.third_win_percent).to eq(25.0)
  end
  it 'can determine fourth_pick_percent and fourth_win_percent' do
    hero = Hero.new(one_pick: 21, two_pick: 21, three_pick: 21, four_pick: 16, five_pick: 21, four_win: 4)

    expect(hero.fourth_pick_percent).to eq(16.0)
    expect(hero.fourth_win_percent).to eq(25.0)
  end
  it 'can determine fifth_pick_percent and fifth_win_percent' do
    hero = Hero.new(one_pick: 21, two_pick: 21, three_pick: 21, four_pick: 21, five_pick: 16, five_win: 4)

    expect(hero.fifth_pick_percent).to eq(16.0)
    expect(hero.fifth_win_percent).to eq(25.0)
  end
end
