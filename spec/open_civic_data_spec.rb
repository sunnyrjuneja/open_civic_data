require 'helper'

describe OpenCivicData do
  before do
    OpenCivicData.key = 'abcd1234'
  end

  describe '.new' do
    it 'returns a OpenCivicData::Client' do
      expect(OpenCivicData.new).to be_a OpenCivicData::Client
    end
    it 'sets key with a block' do
      OpenCivicData.new do |ocd|
        ocd.key = '1234abcd'
      end
      expect(OpenCivicData.key).to eq('1234abcd')
    end
    context 'with no api key' do
      it 'raises an arguement error' do
        expect { OpenCivicData.new(nil) }.to raise_error ArgumentError
      end
    end

    describe '.method_missing' do
      before do
        stub_get('/jurisdictions/', 'apikey' => 'abcd1234').
          to_return(status: 200, body: fixture('jurisdictions.json'))
      end
      it 'delegates to an instance of OpenCivicData::Client' do
        client = OpenCivicData.new
        expect(client).to receive(:jurisdictions)
        OpenCivicData.jurisdictions
      end
    end
  end
end
