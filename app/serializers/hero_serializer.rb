class HeroSerializer < ActiveModel::Serializer
  attributes :name, :hero_id, :matchups

  def matchups
    names_hash = make_hero_hash
    object.metrics.map do |id, rate|
      [names_hash[id.to_i], rate]
    end
  end

  def make_hero_hash
    Hero.all.inject({}) do |hash, hero|
      hash[hero.hero_id] = hero.name
      hash
    end
  end
end
