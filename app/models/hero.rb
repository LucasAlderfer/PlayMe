class Hero < ApplicationRecord

  def first_pick_percent
    (one_pick.to_f / total_picks) * 100
  end

  def first_win_percent
    (one_win.to_f / one_pick) * 100
  end

  def total_picks
    one_pick + two_pick + three_pick + four_pick + five_pick
  end

end
