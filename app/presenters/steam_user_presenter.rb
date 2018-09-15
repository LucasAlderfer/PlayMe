class SteamUserPresenter
  attr_reader :name, :id, :steam_id, :persona, :rank_tier, :mmr, :avatar

  def initialize(user)
    @id = user.id
    @name = user.name
    @steam_id = user.uid
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

  def heroes
    hero_stats
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

  private

  def user_experience_scores
    #need to normalize the win_rate and games from each user_hero so that the values can be assigned scores, so that the scores can be made when iterating over them.
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
    # name_array = hero_names
    # arrays = []
    heroes = user_win_rate_scores
    stats = heroes.inject({}) do |hash, hero|
      current_hero = Hero.find_by(hero_id: hero.id.to_i)
      hash[current_hero.hero_id] = (current_hero.default_score + hero.score)
      hash
    end
    stats
    #   hero_name = ''
    #   name_array.each do |name|
    #     if name.keys.include?(hero.id.to_i)
    #       hero_name = name[hero.id.to_i]
    #     end
    #   end
    #   arrays << [hero_name, hero.win_loss, hero.last_played]
    # end
    # arrays
  end

  def hero_names
    call = request("/api/heroStats")
    call.inject([]) do |array, hero|
      array << { hero['id'] => [hero['localized_name'], hero['icon']] }
    end
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
