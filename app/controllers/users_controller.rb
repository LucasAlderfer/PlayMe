class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @steam_user = SteamUserPresenter.new(user)
  end

end
