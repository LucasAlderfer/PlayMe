class UserHero
  attr_reader :id, :hero, :games
  attr_accessor :score

  def initialize(hero)
    @id = hero['hero_id']
    @hero = hero
    @games = hero['games']
    @score = 0
  end

  def win_rate
    unless @games == 0
      (((@hero['win']).to_f/@hero['games']) * 100).round(2)
    else
      0
    end
  end

  def win_loss
    loss = @hero['games'] - @hero['win']
    "#{@hero['win']} wins and #{loss} losses over #{@hero['games']} total games."
  end

  def last_played
    Time.at(@hero['last_played']).to_datetime
  end

end
