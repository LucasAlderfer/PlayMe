class HerosController < ApplicationController

  def index
    HeroCreationService.new.make_heroes if Hero.all.count == 0
    @heroes = Hero.all
  end

  def create
    HeroCreationService.new.make_heroes
    redirect_back(fallback_location: root_path)
  end

end
