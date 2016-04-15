require './load_environment'

if APP_ENV == 'development'
  require 'pry'

  require 'rack-livereload'
  use Rack::LiveReload
end

require './frontend_serve'
require './api/api'

run Rack::Cascade.new [API::Base, FrontendServe]
