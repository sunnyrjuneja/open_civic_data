require 'helper'

describe OpenCivicData do
  describe '.new' do
    it 'returns a OpenCivicData::Client' do
      OpenCivicData.key = 'abcd1234'
      expect(OpenCivicData.new).to be_a OpenCivicData::Client
    end
    # This test should fail even though it doesn't always
    it 'sets key with a block' do
      OpenCivicData.new do |ocd|
        ocd.key = '1234abcd'
      end
      expect(OpenCivicData.key).to eq('1234abcd')
    end
    context 'with no api key' do
      it 'raises an arguement error' do
        expect(OpenCivicData.key_required).to eql(true)
        expect { OpenCivicData.new(nil) }.to raise_error
      end
      describe 'api key is disabled' do
        before do
          OpenCivicData.key_required = false
        end
        after do
          OpenCivicData.key_required = true
        end
        it 'does not raise an arguement error' do
          expect(OpenCivicData.key_required).to eql(false)
          expect { OpenCivicData.new(nil) }.not_to raise_error
        end
      end
    end
    describe '.endpoint' do
      it 'has a default endpoint' do
        expect(OpenCivicData.endpoint).to eq('http://api.opencivicdata.org')
      end

      describe 'setting a new endpoint' do
        before do
          OpenCivicData.key = 'ghapi'
          OpenCivicData.endpoint = 'http://github.com'
          stub_request(:get, 'http://github.com/jurisdictions/').
            with(query: {'apikey' => 'ghapi'}).
            to_return(status: 200, body: fixture('jurisdictions.json'))
        end
        after do
          OpenCivicData.endpoint = 'http://api.opencivicdata.org'
          OpenCivicData.key = 'abcd1234'
        end
        it 'changes the url queried' do
          OpenCivicData.jurisdictions
          expect(a_request(:get, 'http://github.com/jurisdictions/')
                 .with(query: {'apikey' => 'ghapi'})).to have_been_made
        end
      end
    end
    describe '.method_missing' do
      before do
        OpenCivicData.key = 'abcd1234'
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
