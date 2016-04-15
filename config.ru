require './frontend_serve'
require './api/api'

unless ENV['RACK_ENV'] == 'production'
  require 'rack-livereload'

  use Rack::LiveReload
end

run Rack::Cascade.new [API::Base, FrontendServe]
