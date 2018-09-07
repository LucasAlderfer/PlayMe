class UserHero
  attr_reader :id

  def initialize(hero)
    @id = hero['hero_id']
    @hero = hero
  end

  def win_loss
    loss = @hero['games'] - @hero['win']
    "#{@hero['win']} - #{loss} over #{@hero['games']} total games."
  end

  def last_played
    Time.at(@hero['last_played']).to_datetime
  end

end
