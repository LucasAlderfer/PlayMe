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

  private

  def hero_stats
    name_array = hero_names
    arrays = []
    make_user_heroes.each do |hero|
      hero_name = ''
      name_array.each do |name|
        if name.keys.include?(hero.id.to_i)
          hero_name = name[hero.id.to_i]
        end
      end
      arrays << [hero_name, hero.win_loss, hero.last_played]
    end
    arrays
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
