require 'open_civic_data/connection'
require 'open_civic_data/request'

module OpenCivicData
  class Client
    include Connection
    include Request

    attr_reader :key

    def initialize(key)
      warn 'Warning: Your API key may not be set.' if key.nil?
      @key = key
    end

    # Jurisdictions are governing bodies that exists within a division.
    # Jurisdiction's name, url, chambers, terms, and session details.
    #
    # return [Hashie::Rash]
    # @example
    #   OpenCivicData.key = YOUR_SUNLIGHT_API_KEY
    #   OpenCivicData.jurisdictions
    def jurisdictions(options = {})
      get('/jurisdictions/', options)
    end

    # Divisions are political geographies such as a state, county, or congressional district.
    # Division's geometries and list of child jurisdiction ids.
    #
    # @return [Hashie::Rash]
    # @example
    #   OpenCivicData.key = YOUR_SUNLIGHT_API_KEY
    #   OpenCivicData.divisions
    def divisions(options = {})
      get('/divisions/', options)
    end

    # People, typically a politician or gov official.
    # Person's name, image, contact details, and links.
    #
    # @return [Hashie::Rash]
    # @example
    #   OpenCivicData.key = YOUR_SUNLIGHT_API_KEY
    #   OpenCivicData.people
    def people(options = {})
      get('/people/', options)
    end

    # A group of people, such as a city council, state senate, or committee.
    # Organization's name, classification, parent id, contact details, links and posts.
    #
    # @return [Hashie::Rash]
    # @example
    #   OpenCivicData.key = YOUR_SUNLIGHT_API_KEY
    #   OpenCivicData.organizations
    def organizations(options = {})
      get('/organizations/', options)
    end

    # A legislative event, such as a meeting or hearing.
    # Event's type, name, description, when, end, status, location, and linked entities.
    #
    # @return [Hashie::Rash]
    # @example
    #   OpenCivicData.key = YOUR_SUNLIGHT_API_KEY
    #   OpenCivicData.events
    def events(options = {})
      get('/events/', options)
    end

    # Legislative documents, resolutions, appointments or contract and its history,
    # Bill's type, legislative body, session, name, chamber, title, type, subject and summary.
    #
    # @return [Hashie::Rash]
    # @example
    #   OpenCivicData.key = YOUR_SUNLIGHT_API_KEY
    #   OpenCivicData.bills
    def bills(options = {})
      get('/bills/', options)
    end

    # The record of a vote taken on a motion. May contain individual legilsator's yay/nay or outcome.
    # Vote's organization, session, chamber, date, motion, type and passed or not.
    #
    # @return [Hashie::Rash]
    # @example
    #   OpenCivicData.key = YOUR_SUNLIGHT_API_KEY
    #   OpenCivicData.votes
    def votes(options = {})
      get('/votes/', options)
    end
  end
end
