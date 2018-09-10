class HeroController < ApplicationController

  def index
    @heroes = Hero.all
  end

  def create
    HeroCreationService.make_heroes
    redirect_back(fallback_location: root_path)
  end

end
