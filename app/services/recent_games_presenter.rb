class RecentGamesPresenter
  attr_reader :name

  def initialize(user)
    @steam_id = user.steam_id
    @id = user.id
    @name = user.name
  end

  def games
    make_games
  end


  private

  def make_games
    ids = recent_game_ids
    ids.map do |id|
      game = request("/api/matches/#{id}")
      UserGame.new(game)
    end
  end

  def recent_game_ids
    games = get_recent_games
    games.map do |game|
      game['match_id']
    end
  end

  def get_recent_games
    request("/api/players/#{id_32}/matches?limit=10")
  end

  def id_32
    @steam_id.to_i - 76561197960265728
  end

  def conn
    Faraday.new(url: "https://api.opendota.com")
  end

  def request(url)
    JSON.parse(conn.get(url).body)
  end

end
