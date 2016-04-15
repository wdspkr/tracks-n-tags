APP_ENV = ENV.fetch('APP_ENV', 'development')

unless APP_ENV == 'production'
  require 'dotenv'
  Dotenv.load(
  File.expand_path("../.env.#{APP_ENV}", __FILE__),
  File.expand_path("../.env",  __FILE__))
end
