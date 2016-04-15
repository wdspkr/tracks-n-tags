require 'jsonapi-serializers'

class TrackSerializer
  include JSONAPI::Serializer

  attribute :url
end
