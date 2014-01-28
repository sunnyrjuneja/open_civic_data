require 'helper'

describe OpenCivicData::Client do
  before do
    apikey = 'abcd1234'
    @client = OpenCivicData::Client.new(apikey)
    @options = { 'apikey' => apikey }
  end

  describe '#jurisdictions' do
    before do
      stub_get('/jurisdictions',@options).
        to_return(status: 200, body: fixture('jurisdictions.json'))
    end
    it 'fetches jurisdictions in the United States' do
      jurisdictions = @client.jurisdictions
      expect(a_get('/jurisdictions').with(query: { 'apikey' => 'abcd1234' })).to have_been_made
      expect(jurisdictions['meta']['count']).to eq(61)
      expect(jurisdictions['results'].first.division_id).to eq('ocd-division/country:us/state:al')
    end
  end

  describe '#divisions' do
  end

  describe '#organizations' do
  end

  describe '#people' do
  end

  describe '#bills' do
  end

  describe '#votes' do
  end

  describe '#events' do
  end
end
