ENV['APP_ENV'] = 'test'
require './load_environment'

require 'rspec/core'
require 'rack/test'
require 'factory_girl'
require 'rspec/json_expectations'
require 'pry'

require_relative '../api'

RSpec.configure do |config|
  config.around(:each) do |example|
    DB.transaction(:rollback=>:always, :auto_savepoint=>true) { example.run }
  end

  config.include FactoryGirl::Syntax::Methods
  config.before(:suite) do
    Dir[File.join(__dir__, 'factories', '*.rb')].each {|file| require file }
  end

  config.include RSpec::JsonExpectations::Matchers
end
