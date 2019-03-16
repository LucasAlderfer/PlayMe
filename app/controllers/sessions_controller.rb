class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    auth = request.env['omniauth.auth']
    user = User.find_by_uid(auth['uid']) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    flash[:notice] = "Signed In As #{user.name}"
    redirect_to dashboard_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
