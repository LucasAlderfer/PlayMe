class MetricsProcessor
  attr_reader :pro_hash

  def initialize
    @heroes = Hero.all
    @pro_hash = {}
    @win_hash = {}
  end

  def make_hero_scores
    make_pro_hash
    make_win_hash
    @heroes.each do |hero|
      score = (@pro_hash[hero.id]) + (@win_hash[hero.id])
      hero.update(default_score: score)
    end
  end

  def make_pro_hash
    pro_hero_hash
  end

  def make_win_hash
    win_rate_hash
  end

  def hero_pick_array
    @heroes.map do |hero|
      hero.total_pro_participation
    end
  end

  def split_pro_pick_array
    sorted_hero_array = hero_pick_array.sort
    high = sorted_hero_array.pop(50)
    low = sorted_hero_array.shift(66)
    [low, high]
  end

  def make_pro_pick_groups
    low_group = split_pro_pick_array[0]
    high_group = split_pro_pick_array[1]
    pro_0 = low_group.shift(6)
    pro_1 = low_group.shift(6)
    pro_2 = low_group.shift(6)
    pro_3 = low_group.shift(6)
    pro_4 = low_group.shift(6)
    pro_5 = low_group.shift(6)
    pro_6 = low_group.shift(6)
    pro_7 = low_group.shift(6)
    pro_8 = low_group.shift(6)
    pro_9 = low_group.shift(6)
    pro_10 = low_group.shift(6)
    pro_11 = high_group.shift(5)
    pro_12 = high_group.shift(5)
    pro_13 = high_group.shift(5)
    pro_14 = high_group.shift(5)
    pro_15 = high_group.shift(5)
    pro_16 = high_group.shift(5)
    pro_17 = high_group.shift(5)
    pro_18 = high_group.shift(5)
    pro_19 = high_group.shift(5)
    pro_20 = high_group.shift(5)
    [pro_0, pro_1, pro_2, pro_3, pro_4, pro_5, pro_6, pro_7, pro_8, pro_9, pro_10, pro_11, pro_12, pro_13, pro_14, pro_15, pro_16, pro_17, pro_18, pro_19, pro_20]
  end

  def assign_pro_group_points
    score_hash = {}
    points = 0
    make_pro_pick_groups.each do |group|
      group.each do |score|
        score_hash[score] = points
      end
      points += 1
    end
    score_hash
  end

  def pro_hero_hash
    @heroes.each do |hero|
      score = assign_pro_group_points[hero.total_pro_participation]
      @pro_hash[hero.id] = score
    end
  end

  def win_rate_array
    @heroes.map do |hero|
      hero.win_rate
    end
  end

  def split_win_rate_array
    sorted_win_rate_array = win_rate_array.sort
    high = sorted_win_rate_array.pop(24)
    low = sorted_win_rate_array.shift(92)
    [low, high]
  end

  def make_win_rate_groups
    low_group = split_win_rate_array[0]
    high_group = split_win_rate_array[1]
    win_rate_0 = low_group.shift(4)
    win_rate_1 = low_group.shift(4)
    win_rate_2 = low_group.shift(4)
    win_rate_3 = low_group.shift(4)
    win_rate_4 = low_group.shift(4)
    win_rate_5 = low_group.shift(4)
    win_rate_6 = low_group.shift(4)
    win_rate_7 = low_group.shift(4)
    win_rate_8 = low_group.shift(4)
    win_rate_9 = low_group.shift(4)
    win_rate_10 = low_group.shift(4)
    win_rate_11 = low_group.shift(4)
    win_rate_12 = low_group.shift(4)
    win_rate_13 = low_group.shift(4)
    win_rate_14 = low_group.shift(4)
    win_rate_15 = low_group.shift(4)
    win_rate_16 = low_group.shift(4)
    win_rate_17 = low_group.shift(4)
    win_rate_18 = low_group.shift(4)
    win_rate_19 = low_group.shift(4)
    win_rate_20 = low_group.shift(4)
    win_rate_21 = low_group.shift(4)
    win_rate_22 = low_group.shift(4)
    win_rate_23 = high_group.shift(3)
    win_rate_24 = high_group.shift(3)
    win_rate_25 = high_group.shift(3)
    win_rate_26 = high_group.shift(3)
    win_rate_27 = high_group.shift(3)
    win_rate_28 = high_group.shift(3)
    win_rate_29 = high_group.shift(3)
    win_rate_30 = high_group.shift(3)
    [win_rate_0, win_rate_1, win_rate_2, win_rate_3, win_rate_4, win_rate_5, win_rate_6, win_rate_7, win_rate_8, win_rate_9, win_rate_10, win_rate_11, win_rate_12, win_rate_13, win_rate_14, win_rate_15, win_rate_16, win_rate_17, win_rate_18, win_rate_19, win_rate_20, win_rate_21, win_rate_22, win_rate_23, win_rate_24, win_rate_25, win_rate_26, win_rate_27, win_rate_28, win_rate_29, win_rate_30]
  end

  def assign_win_rate_group_points
    score_hash = {}
    points = 0
    make_win_rate_groups.each do |group|
      group.each do |score|
        score_hash[score] = points
      end
      points += 1
    end
    score_hash
  end

  def win_rate_hash
    @heroes.each do |hero|
      score = assign_win_rate_group_points[hero.win_rate]
      @win_hash[hero.id] = score
    end
  end

  # def pro_picks
  #   pro_pick_standard_dev
  # end
  #
  # def average_pro_picks
  #   participation = @heroes.map do |hero|
  #     hero.total_pro_participation
  #   end
  #   ((participation.sum).to_f/(participation.count)).round(2)
  # end
  #
  # def pro_pick_standard_dev
  #   participation = @heroes.map do |hero|
  #     hero.total_pro_participation
  #   end
  #   squares = participation.map do |participate|
  #     difference = participate - average_pro_picks
  #     difference ** 2
  #   end
  #   new_mean = ((squares.sum).to_f/(squares.count)).round(2)
  #   Math.sqrt(new_mean)
  # end

end
#@heroes.select("heros.*, heros.metrics['pro_participation'] as participation").order('participation desc').limit(58)
