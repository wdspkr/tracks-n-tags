require 'sequel'
require 'pg'

DB = Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/tracksntags')
