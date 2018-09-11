class MatchupsController < ApplicationController

  def index
    if Matchup.all.count == 0
      Matchup.create(array: HeroMatchupService.new.info)
    end
    @hero_matchups = Matchup.first.array
  end

end
