require 'sequel'
require 'pg'

Sequel::Model.plugin :timestamps, update_on_create: true

DB = Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/tracksntags')
