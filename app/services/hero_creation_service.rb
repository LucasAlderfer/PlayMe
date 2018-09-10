class HeroCreationService

  def self.make_heroes
    get_hero_stats.each do |hero|
      hero_id = hero['id']
      icon = 'https://api.opendota.com' + hero['icon']
      name = hero['localized_name']
      attribute = hero['primary_attr']
      range = hero['attack_type']
      pro_pick = hero['pro_pick']
      pro_win = hero['pro_win']
      pro_ban = hero['pro_ban']
      one_pick = hero['1_pick']
      one_win = hero['1_win']
      two_pick = hero['2_pick']
      two_win = hero['2_win']
      three_pick = hero['3_pick']
      three_win = hero['3_win']
      four_pick = hero['4_pick']
      four_win = hero['4_win']
      five_pick = hero['5_pick']
      five_win = hero['5_win']
      unless Hero.find_by(hero_id: hero_id).nil?
        Hero.create(hero_id: hero_id, name: name, attr: attribute, range: range, icon: icon, pro_pick: pro_pick, pro_win: pro_win, pro_ban: pro_ban, one_pick: one_pick, one_win: one_win, two_pick: two_pick, two_win: two_win, three_pick: three_pick, three_win: three_win, four_pick: four_pick, four_win: four_win, five_pick: five_pick, five_win: five_win)
      else
        Hero.update(pro_pick: pro_pick, pro_win: pro_win, pro_ban: pro_ban, one_pick: one_pick, one_win: one_win, two_pick: two_pick, two_win: two_win, three_pick: three_pick, three_win: three_win, four_pick: four_pick, four_win: four_win, five_pick: five_pick, five_win: five_win)
      end
    end
  end

  private

  def conn
    Faraday.new(url: "https://api.opendota.com")
  end

  def request(url)
    JSON.parse(conn.get(url).body)
  end

  def get_hero_stats
    request("/api/heroStats")
  end

end
