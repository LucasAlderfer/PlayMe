require 'rails_helper'

describe 'visiting /' do
  context 'as a visitor' do
    it 'can create a hero database' do
      expect(Hero.all).to eq([])

      visit '/'

      click_on 'General Hero Stats'

      expect(current_path).to eq(heros_path)
      expect(Hero.all.count).to eq(116)
      expect(page).to have_css('.hero', count: 116)
    end
    it 'can update a hero database' do
      Hero.create(hero_id: 1)
      Hero.create(hero_id: 2)
      Hero.create(hero_id: 3)
      Hero.create(hero_id: 4)
      Hero.create(hero_id: 5)
      Hero.create(hero_id: 6)
      Hero.create(hero_id: 7)
      Hero.create(hero_id: 8)
      Hero.create(hero_id: 9)
      Hero.create(hero_id: 10)
      expect(Hero.all.count).to eq(10)

      visit heros_path

      expect(page).to have_css('.hero', count: 10)

      click_on 'Update Heroes'

      expect(current_path).to eq(heros_path)
      expect(Hero.all.count).to eq(116)
      expect(page).to have_css('.hero', count: 116)
    end
  end
end
