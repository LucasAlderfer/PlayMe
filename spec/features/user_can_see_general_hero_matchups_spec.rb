require 'rails_helper'

describe 'visiting /hero-matchups' do
  it 'shows winrates for each hero against each opponent' do
    visit '/hero-matchups'

    expect(page).to have_css('.hero', count: 116)
    expect(page).to have_css('.hero-matchup', count: 13340)
  end
end
