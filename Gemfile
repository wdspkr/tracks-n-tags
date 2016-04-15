ruby '2.2.4'

source 'https://rubygems.org'

gem 'dotenv', :groups => [:development, :test]

gem 'sinatra'

gem 'rake'
gem 'grape'
gem 'grape_logging'
gem 'sequel'
gem 'jsonapi-serializers'
gem 'jsonapi_parser'
gem 'pg'

group :development do
  gem 'pry-nav'
  gem 'shotgun'
  gem 'rack-livereload'
  gem 'guard-livereload', require: false
end

group :development, :test do
  gem 'rspec'
  gem 'factory_girl'
  gem 'rspec-json_expectations'
  gem 'rack-test'
end
