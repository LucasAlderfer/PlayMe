class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if params[:password] == params[:password_confirmation]
      user = User.new(user_params)
      if user.save!
        session[:user_id] = user.id
        redirect_to user_path(current_user)
      else
        flash[:error] = 'New user not created, please try again!'
        render :new
      end
    end
  end

  def show
    user = User.find(params[:id])
    @steam_user = SteamUserPresenter.new(user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :steam_id, :email, :password)
  end

end
