desc 'This will set up the database for a user locally'
task :setup do
  HeroCreationService.new.make_heroes
  HeroMatchupService.new.update_heroes
end
