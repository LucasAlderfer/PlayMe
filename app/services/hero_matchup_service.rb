class HeroMatchupService

  def conn
    Faraday.new(url: "https://api.opendota.com")
  end

  def request(url)
    JSON.parse(conn.get(url).body)
  end

  def get_hero_matchups(id)
    request("/api/heroes/#{id}/matchups?api_key=#{ENV['OPEN_DOTA_API_KEY']}")
  end

  def update_heroes
    hero_ids = Hero.pluck(:hero_id).sort
    hero_ids.each do |id|
      hero_hash = {}
      hero = Hero.find_by(hero_id: id)
      body = get_hero_matchups(id)
      body.each do |matchup|
        hero_hash[matchup['hero_id']] = ((((matchup['wins']).to_f) / matchup['games_played']) * 100).round(2)
      end
      hero.update!(metrics: hero_hash)
      sleep(1)
    end
  end

end
