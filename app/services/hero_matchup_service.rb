class HeroMatchupService

  def info
    format_matchups
  end

  # private

  def conn
    Faraday.new(url: "https://api.opendota.com")
  end

  def request(url)
    JSON.parse(conn.get(url).body)
  end

  def get_hero_matchups(id)
    request("/api/heroes/#{id}/matchups")
  end

  def format_matchups
    matchup_array = []
    hero_ids = Hero.pluck(:hero_id).sort
    hero_ids.each do |id|
      hero_array = []
      hero = Hero.find_by(hero_id: id)
      hero_array << ['hero', [hero.icon, hero.name]]
      body = get_hero_matchups(id)
      body.each do |matchup|
        hero_array << [matchup['hero_id'], ((((matchup['wins']).to_f) / matchup['games_played']) * 100).round(2)]
      end
      matchup_array << hero_array
      sleep(1.5)
    end
    matchup_array
  end

end
