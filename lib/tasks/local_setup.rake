desc 'This will set up the database for a user locally'
task setup: :environment do
  HeroCreationService.new.make_heroes
  HeroMatchupService.new.update_heroes
end
