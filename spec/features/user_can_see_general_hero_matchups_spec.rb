require 'rails_helper'

describe 'visiting /hero-matchups' do
  it 'shows winrates for each hero against each opponent' do
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
    visit '/hero-matchups'
    expect(page).to have_css('.hero', count: 3)
    expect(page).to have_css('.hero-matchup', count: 9)
  end
end
