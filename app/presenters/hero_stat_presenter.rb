class HeroStatPresenter

  def initialize(hero_array)
    @heroes = hero_array
  end

  def display
    pro_participation
  end

  private

  def pro_participation #how to attach the metrics to the array of heroes...
    @heroes.each do |hero|
      hero.metrics['pro_participation'] = ((hero.total_pro_participation.to_f / pro_match_count) * 100).round(2)
      hero.save!
    end
  end

  def pro_match_count
    total_picks = @heroes.inject(0) do |sum, hero|
      sum += hero.pro_pick
      sum
    end
    total_picks / 10
  end

end
