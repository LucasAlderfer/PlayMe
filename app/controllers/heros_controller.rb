class HerosController < ApplicationController

  def index
    HeroCreationService.new.make_heroes if Hero.all.count == 0
    HeroStatPresenter.new(Hero.all).display
    @heroes = Hero.order(:name)
  end

  def create
    HeroCreationService.new.make_heroes
    redirect_back(fallback_location: root_path)
  end

end
