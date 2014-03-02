require 'open_civic_data/connection'
require 'open_civic_data/request'

module OpenCivicData
  class Client
    include Connection
    include Request

    attr_reader :key

    @@key_required = true # rubocop:disable ClassVars
    @@endpoint = 'http://api.opencivicdata.org' # rubocop:disable ClassVars

    def initialize(key)
      fail ArgumentError, 'API key required' if key.nil? && @@key_required
      @key = key
    end

    # Fetches governing bodies that exist within a division
    # @return [Hashie::Rash] Jurisdiction's name, url, chambers, terms, and session details.
    # @example
    #   OpenCivicData.key = YOUR_SUNLIGHT_API_KEY
    #   OpenCivicData.jurisdictions
    # @api public
    def jurisdictions(options = {})
      get('/jurisdictions/', options)
    end

    # Fetches political geographies such as a state, county or congressional district
    # @return [Hashie::Rash] Division's geometries and list of child jurisdiction ids.
    # @example
    #   OpenCivicData.key = YOUR_SUNLIGHT_API_KEY
    #   OpenCivicData.divisions
    # @api public
    def divisions(options = {})
      get('/divisions/', options)
    end

    # Fetches people, typically politicians or gov officials
    # @return [Hashie::Rash] Person's name, image, contact details, and links.
    # @example
    #   OpenCivicData.key = YOUR_SUNLIGHT_API_KEY
    #   OpenCivicData.people
    # @api public
    def people(options = {})
      get('/people/', options)
    end

    # Fetches groups of people, such as a city council, state senate or committee
    # @return [Hashie::Rash] Organization's name, classification, parent id, contact details, links and posts.
    # @example
    #   OpenCivicData.key = YOUR_SUNLIGHT_API_KEY
    #   OpenCivicData.organizations
    # @api public
    def organizations(options = {})
      get('/organizations/', options)
    end

    # Fetches legislative event, such as a meeting or hearing
    # @return [Hashie::Rash] Event's type, name, description, when, end, status, location, and linked entities.
    # @example
    #   OpenCivicData.key = YOUR_SUNLIGHT_API_KEY
    #   OpenCivicData.events
    # @api public
    def events(options = {})
      get('/events/', options)
    end

    # Fetches legislative documents and their history
    # @return [Hashie::Rash] Bill's type, legislative body, session, name, chamber, title, type, subject and summary.
    # @example
    #   OpenCivicData.key = YOUR_SUNLIGHT_API_KEY
    #   OpenCivicData.bills
    # @api public
    def bills(options = {})
      get('/bills/', options)
    end

    # Fetches the record of vote taken on motions
    # @return [Hashie::Rash] Vote's organization, session, chamber, date, motion, type and passed or not.
    # @example
    #   OpenCivicData.key = YOUR_SUNLIGHT_API_KEY
    #   OpenCivicData.votes
    # @api public
    def votes(options = {})
      get('/votes/', options)
    end

    class << self
      # Disable ArgumentError if no api key is provided. Useful for using different endpoints.
      # @param [Boolean]
      # @api public
      # @example
      #   OpenCivicData.key_required(false)
      #   OpenCivicData.jurisdictions
      def key_required=(bool)
        @@key_required = bool # rubocop:disable ClassVars
      end

      # Check if key is required.
      # @return [Boolean]
      # @api public
      # @example
      #   if OpenCivicData.key_required
      #     OpenCivicData.key = SUNLIGHT_KEY
      def key_required
        @@key_required
      end

      def endpoint=(endpoint)
        @@endpoint = endpoint
      end

      def endpoint
        @@endpoint
      end
    end
  end
end
