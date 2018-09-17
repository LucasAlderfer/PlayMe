class SteamUserPresenter
  attr_reader :name, :id, :steam_id, :persona, :rank_tier, :mmr, :avatar

  def initialize(user)
    @id = user.id
    @name = user.name
    @steam_id = user.uid
    @fun_settings = user.fun_settings
    @random_settings = user.random_settings
    @persona = get_persona
    @rank_tier = get_rank_tier
    @mmr = get_mmr
    @avatar = get_avatar
  end
  def get_persona
    user_setup['profile']['personaname']
  end

  def get_rank_tier
    user_setup['rank_tier']
  end

  def get_mmr
    user_setup['mmr_estimate']['estimate']
  end

  def get_avatar
    user_setup['profile']['avatar']
  end

  def top_heroes
    top = hero_stats.sort_by { |hero_id, score| score }.reverse[0..9]
    ids = top.map do |hero|
      hero[0]
    end
    heroes = ids.map do |id|
      Hero.find_by(hero_id: id)
    end
    heroes
  end

  def fun_heroes
    pool_array = Hero.where(hero_id: @fun_settings)
    scores = user_win_rate_scores
    score_hash = {}
    scores.each do |score|
      pool_array.each do |hero|
        if hero.hero_id == score.id.to_i
          total_score = (score.score + hero.default_score)
          score_hash[total_score] = hero.hero_id
        end
      end
    end
    top_array = score_hash.keys.sort.reverse[0..9].compact
    hero_array = top_array.map do |score|
      Hero.find_by(hero_id: score_hash[score])
    end
    hero_array
  end

  def random_heroes
    pool = Hero.pluck(:hero_id)
    pool.delete_if { |id| @random_settings.include?(id.to_s) }
    Hero.where(hero_id: pool)
  end

  private

  def user_experience_scores
    user_heroes = []
    heroes = make_user_heroes.reverse
    points = 0
    12.times {
      hero_group = heroes.shift(5)
      hero_group.each do |hero|
        hero.score += points
        user_heroes << hero
      end
      points += 1
    }
    14.times {
      hero_group = heroes.shift(4)
      hero_group.each do |hero|
        hero.score += points
        user_heroes << hero
      end
      points += 1
    }
    user_heroes
  end

  def user_win_rate_scores
    user_heroes = []
    heroes = user_experience_scores
    sorted_heroes = heroes.sort_by { |hero| hero.win_rate }
    points = 0
    12.times {
      hero_group = sorted_heroes.shift(5)
      hero_group.each do |hero|
        hero.score += points
        user_heroes << hero
      end
      points += 1
    }
    14.times {
      hero_group = sorted_heroes.shift(4)
      hero_group.each do |hero|
        hero.score += points
        user_heroes << hero
      end
      points += 1
    }
    user_heroes
  end

  def hero_stats
    heroes = user_win_rate_scores
    stats = heroes.inject({}) do |hash, hero|
      current_hero = Hero.find_by(hero_id: hero.id.to_i)
      hash[current_hero.hero_id] = (current_hero.default_score + hero.score)
      hash
    end
    stats
  end

  def user_heroes_setup
    request("/api/players/#{id_32}/heroes")
  end

  def make_user_heroes
    user_heroes_setup.inject([]) do |array, hero|
      array << UserHero.new(hero)
    end
  end

  def id_32
    @steam_id.to_i - 76561197960265728
  end

  def user_setup
    request("/api/players/#{id_32}")
  end

  def conn
    Faraday.new(url: "https://api.opendota.com")
  end

  def request(url)
    JSON.parse(conn.get(url).body)
  end

end
