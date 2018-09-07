class RecentGamesController < ApplicationController

  def show
    @recent_games = RecentGamesPresenter.new(User.find(params[:user_id]))
  end

end
