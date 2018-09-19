require 'rails_helper'

describe HeroMatchupService do
  it 'can create all the matchups' do
    hero_1 = Hero.create(name: 'hero 1', hero_id: 1, icon: 'icon 1')
    hero_2 = Hero.create(name: 'hero 2', hero_id: 2, icon: 'icon 2')
    hero_3 = Hero.create(name: 'hero 3', hero_id: 3, icon: 'icon 3')
    matchups = [
                {'hero_id' => 1 ,
                  'games_played' => 5,
                  'wins' => 1 },
                {'hero_id' => 2,
                  'games_played' => 5,
                  'wins' => 2 },
                {'hero_id' => 3,
                  'games_played' => 5,
                  'wins' => 3 }
    ]
    allow_any_instance_of(HeroMatchupService).to receive(:get_hero_matchups).and_return(matchups)
    expected = {'1' => 20.0, '2'=>40.0, '3'=>60.0}
    heromatchup = HeroMatchupService.new.update_heroes
    expect(Hero.find_by(hero_id:1).metrics).to eq(expected)
  end
  it 'can update the heroes' do
    hero_1 = Hero.create(name: 'hero 1', hero_id: 1, icon: 'icon 1')
    hero_2 = Hero.create(name: 'hero 2', hero_id: 2, icon: 'icon 2')
    hero_3 = Hero.create(name: 'hero 3', hero_id: 3, icon: 'icon 3')
    matchups = [
                {'hero_id' => 1 ,
                  'games_played' => 5,
                  'wins' => 1 },
                {'hero_id' => 2,
                  'games_played' => 5,
                  'wins' => 2 },
                {'hero_id' => 3,
                  'games_played' => 5,
                  'wins' => 3 }
    ]
    allow_any_instance_of(HeroMatchupService).to receive(:get_hero_matchups).and_return(matchups)
    heromatchup = HeroMatchupService.new
    expect(Hero.find_by(hero_id:1).metrics.keys.count).to eq(0)
    heromatchup.update_heroes
    expect(Hero.find_by(hero_id:1).metrics.keys.count).to eq(3)
  end
end
