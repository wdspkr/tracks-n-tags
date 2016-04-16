require_relative '../spec_helper'

describe API::Tracks do
  include Rack::Test::Methods

  def app
    API::Base
  end

  let(:json_response) { JSON.parse(last_response.body) }

  context 'GET /api/tracks' do
    let(:request) { get '/api/tracks' }

    it 'returns an array of tracks' do
      create(:track, url: 'http://my-url.com')
      create(:track, url: 'http://my-other-url.com')

      request
      expect(last_response.status).to eq(200)
      expect(json_response).to include_json(
        data: UnorderedArray(
          { type: 'tracks',
            attributes: {url: 'http://my-url.com'}
          },
          { type: 'tracks',
            attributes: {url: 'http://my-other-url.com'}
          }
        )
      )
    end

    it 'returns empty jsonapi response without tracks' do
      request
      expect(last_response.status).to eq(200)
      expect(json_response).to include_json(
        data: []
      )
    end
  end

  context 'POST /api/tracks' do
    let(:request) { post '/api/tracks', params }
    let(:params) do
      { data:
        { type: 'tracks',
          attributes: {url: 'http://some.url'}
        }
      }
    end

    it 'creates a track and returns it' do
      expect{ request }.to change{ Track.count }.by(1)
      expect(last_response.status).to eq(201)
      expect(json_response).to include_json(
        data:
          { type: 'tracks',
            attributes: {url: 'http://some.url'}
          }
      )
      expect(Track.last.url).to eq('http://some.url')
    end
  end
end
