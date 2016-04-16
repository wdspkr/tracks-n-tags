require 'grape'
require 'grape_logging'
Dir[File.join(__dir__, '*.rb')].each {|file| require file }

module API
  class Base < Grape::API
    if APP_ENV == "development"
      logger.formatter = GrapeLogging::Formatters::Default.new
      use GrapeLogging::Middleware::RequestLogger, { logger: logger }
    end

    format :json
    content_type :json, 'application/vnd.api+json'

    namespace :api do
      mount API::Tracks
    end
  end
end
