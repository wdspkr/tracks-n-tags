require_relative '../spec_helper'

describe API::Tracks do
  include Rack::Test::Methods

  def app
    API::Base
  end

  context 'GET /api/tracks' do
    it 'returns an empty array of tracks' do
      get '/api/tracks'
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq({"data" => []})
    end
  end

end
