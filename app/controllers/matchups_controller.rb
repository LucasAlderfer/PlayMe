class MatchupsController < ApplicationController

  def index
    if Matchup.all.count == 0
      Matchup.create(array: HeroMatchupService.new.info)
    end
    @hero_matchups = MatchupsPresenter.new(Matchup.first.array, Hero.pluck(:hero_id).sort)
  end

end
