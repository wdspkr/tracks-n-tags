require 'grape'
require 'jsonapi-serializers'
require_relative 'db'
require_relative 'models/track'

class TrackSerializer
  include JSONAPI::Serializer

  attribute :url
end

class API < Grape::API
  format :json
  content_type :json, 'application/vnd.api+json'

  namespace :api do
    get :tracks do
      tracks = Track.all
      JSONAPI::Serializer.serialize(tracks, is_collection: true)
    end
  end

  get :hello do
    { hello: 'world' }
  end
end
