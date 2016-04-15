namespace :db do
  desc 'Run migrations'
  task :migrate, [:version] do |t, args|
    require './load_environment'

    require 'sequel'
    Sequel.extension :migration
    db = Sequel.connect(ENV.fetch('DATABASE_URL'))

    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(db, 'api/db/migrations', target: args[:version].to_i)
    else
      puts 'Migrating to latest'
      Sequel::Migrator.run(db, 'api/db/migrations')
    end
  end
end
