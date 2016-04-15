require_relative '../spec_helper'

describe API::Tracks do
  include Rack::Test::Methods

  def app
    API::Base
  end

  context 'GET /api/tracks' do
    it 'returns an array of tracks' do
      create(:track, url: "http://my-url.com")
      create(:track, url: "http://my-other-url.com")
      get '/api/tracks'
      expect(last_response.status).to eq(200)
      response = JSON.parse(last_response.body) #["data"][0]
      expect(response).to include_json(
        data: UnorderedArray(
          { type: "tracks",
            attributes: {url: "http://my-url.com"}
          },
          { type: "tracks",
            attributes: {url: "http://my-other-url.com"}
          }
        )
      )
    end
  end

end
