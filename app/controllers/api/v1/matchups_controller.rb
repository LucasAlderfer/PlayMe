class Api::V1::MatchupsController < ActionController::API

  def show
    render json: Hero.find(params[:id])
  end

end
