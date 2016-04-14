require 'grape'
require 'grape_logging'
require 'jsonapi-serializers'
require 'json/api'
require_relative 'db'
require_relative 'models/track'

class TrackSerializer
  include JSONAPI::Serializer

  attribute :url
end

class API < Grape::API
  logger.formatter = GrapeLogging::Formatters::Default.new
  use GrapeLogging::Middleware::RequestLogger, { logger: logger }

  format :json
  content_type :json, 'application/vnd.api+json'

  namespace :api do
    get :tracks do
      tracks = Track.all
      JSONAPI::Serializer.serialize(tracks, is_collection: true)
    end

    post :tracks do
      track = JSON::API.parse(params)
      if track.data.type
        track = Track.new(url: track.data.attributes.url)
        track.save
        JSONAPI::Serializer.serialize(track, skip_collection_check: true)
      end
    end
  end

  get :hello do
    { hello: 'world' }
  end
end
