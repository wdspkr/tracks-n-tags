require './frontend_serve'
require './api/api'

run Rack::Cascade.new [API, FrontendServe]
