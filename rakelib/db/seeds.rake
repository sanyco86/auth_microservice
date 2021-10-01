namespace :db do
  desc 'Run database seed'
  task :seeds, %i[version] => :settings do |_, args|
    require 'sequel/core'
    require 'sequel/extensions/seed'
    Sequel.extension :seed
    Sequel::Seed.setup(ENV['RACK_ENV'])

    Sequel.connect(Settings.db.to_hash) do |db|
      version = args.version.to_i if args.version
      seeds = File.expand_path('../../db/seeds', __dir__)

      Sequel::Seeder.apply(db, seeds, target: version)
    end
  end
end
