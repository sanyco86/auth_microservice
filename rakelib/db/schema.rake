namespace :db do
  desc 'Run database schema'
  task :schema, %i[version] => :settings do |_|
    require 'sequel'

    Sequel.connect(Settings.db.to_hash) do |db|
      db.extension(:schema_dumper)

      schema_dir = File.expand_path('../../../db', __FILE__)
      schema_file = File.join(schema_dir, 'schema.rb')

      File.open(schema_file.to_s, 'w') do |file|
        file << db.dump_schema_migration(indexes: true, foreign_keys: true)
      end
    end
  end
end
