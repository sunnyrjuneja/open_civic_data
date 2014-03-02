require 'helper'

describe OpenCivicData::Client do
  before do
    @client = OpenCivicData::Client.new('abcd1234')
    @options = {'apikey' => 'abcd1234'}
  end

  describe '#jurisdictions' do
    before do
      stub_get('/jurisdictions/', @options).
        to_return(status: 200, body: fixture('jurisdictions.json'))
    end
    it "fetches jurisdictions' name, url, chambers, terms, and session details" do
      jurisdictions = @client.jurisdictions
      expect(a_get('/jurisdictions/').with(query: @options)).to have_been_made
      expect(jurisdictions['meta']['total_count']).to eq(61)
      expect(jurisdictions['results'].first.id).to eq('ocd-jurisdiction/country:us/state:al/legislature')
    end
  end

  describe '#divisions' do
    before do
      stub_get('/divisions/', @options).
        to_return(status: 200, body: fixture('divisions.json'))
    end
    it "fetches divisions' political geographies" do
      divisions = @client.divisions
      expect(a_get('/divisions/').with(query: @options)).to have_been_made
      expect(divisions['meta']['total_count']).to eq(29326)
      expect(divisions['results'].first.id).to eq('ocd-division/country:us/district:dc/ward:1')
    end
  end

  describe '#organizations' do
    before do
      stub_get('/organizations/', @options).
        to_return(status: 200, body: fixture('organizations.json'))
    end
    it "fetches organizations' name, classification, contact details, links and posts" do
      organizations = @client.organizations
      expect(a_get('/organizations/').with(query: @options)).to have_been_made
      expect(organizations['meta']['total_count']).to eq(3695)
      expect(organizations['results'].first.id).to eq('ocd-organization/5794f206-7acf-11e3-8bdc-22000a8b123e')
    end
  end

  describe '#people' do
    before do
      stub_get('/people/', @options).
        to_return(status: 200, body: fixture('people.json'))
    end
    it "fetches politician or gov officials' name, image, and contact details." do
      people = @client.people
      expect(a_get('/people/').with(query: @options)).to have_been_made
      expect(people['meta']['total_count']).to eq(10699)
      expect(people['results'].first.id).to eq('ocd-person/8a7c4fbc-7ad3-11e3-8bdc-22000a8b123e')
    end
  end

  describe '#bills' do
    before do
      stub_get('/bills/', @options).
        to_return(status: 200, body: fixture('bills.json'))
    end
    it "fetches bills' legislative body, session, name, chamber, subject and summary" do
      bills = @client.bills
      expect(a_get('/bills/').with(query: @options)).to have_been_made
      expect(bills['meta']['total_count']).to eq(529811)
      expect(bills['results'].first.id).to eq('ocd-bill/5473d3fc-d90e-11e2-81e4-1231391cd4ec')
    end
  end

  describe '#votes' do
    before do
      stub_get('/votes/', @options).
        to_return(status: 200, body: fixture('votes.json'))
    end
    it "fetches votes' session, chamber, date, motion and type" do
      votes = @client.votes
      expect(a_get('/votes/').with(query: @options)).to have_been_made
      expect(votes['meta']['total_count']).to eq(263231)
      expect(votes['results'].first.id).to eq('ocd-vote/6e8155d8-5eb2-11e3-bc39-1231391cd4ec')
    end
  end

  describe '#events' do
    before do
      stub_get('/events/', @options).
        to_return(status: 200, body: fixture('events.json'))
    end
    it "fetches events' name, description, time status, location and linked entities" do
      events = @client.events
      expect(a_get('/events/').with(query: @options)).to have_been_made
      expect(events['meta']['total_count']).to eq(69419)
      expect(events['results'].first.id).to eq('ocd-event/a4742e1c-7ace-11e3-8bdc-22000a8b123e')
    end
  end
end
