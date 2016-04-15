ENV['APP_ENV'] = 'test'
require './load_environment'

require 'rspec/core'
require 'rack/test'
require_relative '../api'

RSpec.configure do |config|
  config.around(:each) do |example|
    DB.transaction(:rollback=>:always, :auto_savepoint=>true) { example.run }
  end
end
