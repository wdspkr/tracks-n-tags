# Load the DB
require_relative 'db'

# Load the models and other objects
%w(models serializers).each do |dir_name|
  Dir[File.join(__dir__, 'app', dir_name, '**', '*.rb')].each {|file| require file }
end

# Load the API
load File.join(__dir__, 'app', 'controllers', 'base.rb')
