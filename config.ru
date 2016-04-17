require './load_environment'

if APP_ENV == 'development'
  require 'pry'
end

require './frontend_serve'
require './api/api'

run Rack::Cascade.new [API::Base, FrontendServe]
