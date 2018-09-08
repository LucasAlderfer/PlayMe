class UserGame
  attr_reader :id, :time

  def initialize(game)
    @game = game
    @id = @game['match_id']
    @time = @game['start_time']
  end

  def players
    { radiant: format_radiant, dire: format_dire }
  end

  private

  def split_teams
    player_hash = @game['players']
    radiant = []
    dire = []
    player_hash.each do |player|
      if player['isRadiant']
        radiant << [player['personaname'], player['account_id']]
      else
        dire << [player['personaname'], player['account_id']]
      end
    end
    [radiant, dire]
  end

  def format_radiant
    split_teams[0].map do |player|
      Player.new(player)
    end
  end

  def format_dire
    split_teams[1].map do |player|
      Player.new(player)
    end
  end

end
