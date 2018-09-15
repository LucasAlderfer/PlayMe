class Hero < ApplicationRecord

  def first_pick_percent
    ((one_pick.to_f / total_picks) * 100).round(2)
  end

  def first_win_percent
    ((one_win.to_f / one_pick) * 100).round(2)
  end

  def second_pick_percent
    ((two_pick.to_f / total_picks) * 100).round(2)
  end

  def second_win_percent
    ((two_win.to_f / two_pick) * 100).round(2)
  end

  def third_pick_percent
    ((three_pick.to_f / total_picks) * 100).round(2)
  end

  def third_win_percent
    ((three_win.to_f / three_pick) * 100).round(2)
  end

  def fourth_pick_percent
    ((four_pick.to_f / total_picks) * 100).round(2)
  end

  def fourth_win_percent
    ((four_win.to_f / four_pick) * 100).round(2)
  end

  def fifth_pick_percent
    ((five_pick.to_f / total_picks) * 100).round(2)
  end

  def fifth_win_percent
    ((five_win.to_f / five_pick) * 100).round(2)
  end

  def total_picks
    one_pick + two_pick + three_pick + four_pick + five_pick
  end

  def win_rate
    (((one_win + two_win + three_win + four_win + five_win) / total_picks) * 100).round(2)
  end

  def total_pro_participation
    pro_pick + pro_ban
  end

end
