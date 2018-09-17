class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @steam_user = SteamUserPresenter.new(user)
  end

  def update
    user = current_user
    if !params['user']['fun_settings'].nil?
      pool = params['user']['fun_settings']
      pool.delete('0')
      array = pool.map { |id| id.to_i }
      user.update(fun_settings: array)
    elsif !params['user']['random_settings'].nil?
      pool = params['user']['random_settings']
      pool.delete('0')
      array = pool.map { |id| id.to_i }
      user.update(random_settings: array)
    end
    redirect_back(fallback_location: user_settings_path(current_user))
  end

end
