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
    expected = [[['hero', [hero_1.icon, hero_1.name]], [1, 20.0], [2, 40.0], [3, 60.0]], [['hero', [hero_2.icon, hero_2.name]], [1, 20.0], [2, 40.0], [3, 60.0]], [['hero', [hero_3.icon, hero_3.name]], [1, 20.0], [2, 40.0], [3, 60.0]]]
    heromatchup = HeroMatchupService.new
    expect(heromatchup.info).to eq(expected)
    matchup = Matchup.create(array: heromatchup.info)
    expect(matchup.array).to eq(expected)
  end
end
