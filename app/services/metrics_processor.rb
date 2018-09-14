class MetricsProcessor

  def initialize
    @heroes = Hero.all
  end

  def pro_picks
    pro_pick_standard_dev
  end

  def average_pro_picks
    participation = @heroes.map do |hero|
      hero.total_pro_participation
    end
    ((participation.sum).to_f/(participation.count)).round(2)
  end

  def pro_pick_standard_dev
    participation = @heroes.map do |hero|
      hero.total_pro_participation
    end
    squares = participation.map do |participate|
      difference = participate - average_pro_picks
      difference ** 2
    end
    new_mean = ((squares.sum).to_f/(squares.count)).round(2)
    Math.sqrt(new_mean)
  end

end
#@heroes.select("heros.*, heros.metrics['pro_participation'] as participation").order('participation desc').limit(58)
