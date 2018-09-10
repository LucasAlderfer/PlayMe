class SessionsController < ApplicationController

  def create
    if params[:commit] == 'Login'
      user = User.find_by(email: params[:email])
      if user.authenticate(params[:password])
        session[:user_id] = user.id
      else
        flash[:error] = 'Login was unsuccessful!'
        redirect_to '/'
      end
    else
      session[:user_id] = params[:id]
    end
    redirect_to user_path(current_user)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
