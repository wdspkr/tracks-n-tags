require 'json/api'
require 'jsonapi-serializers'

module API
  class Tracks < Grape::API
    desc 'index tracks'
    get :tracks do
      tracks = Track.all
      JSONAPI::Serializer.serialize(tracks, is_collection: true)
    end

    desc 'create track'
    post :tracks do
      track = JSON::API.parse(params)
      if track.data.type
        track = Track.new(url: track.data.attributes.url)
        track.save
        JSONAPI::Serializer.serialize(track, skip_collection_check: true)
      end
    end
  end
end
