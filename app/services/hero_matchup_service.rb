class HeroMatchupService

  # def info
  #   format_matchups
  # end

  # def update_heroes
  #   format_matchups.each do |matchups|
  #     hash = matchups.to_h
  #     hero = Hero.find_by(name: matchups['hero'][1])
  #     hero_ids = Hero.pluck(:hero_id).delete(hero.id)
  #     hero.update(metrics: )
  # end

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
      sleep(1.5)
    end
  end

end
