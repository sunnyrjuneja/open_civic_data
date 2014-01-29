require 'open_civic_data/connection'
require 'open_civic_data/request'

module OpenCivicData
  class Client
    include Connection
    include Request

    attr_reader :key

    def initialize(key)
      fail ArgumentError, 'API key required' if key.nil?
      @key = key
    end

    def jurisdictions(options = {})
      get('/jurisdictions/', options)
    end

    def divisions(options = {})
      get('/divisions/', options)
    end

    def people(options = {})
      get('/people/', options)
    end

    def organizations(options = {})
      get('/organizations/', options)
    end

    def events(options = {})
      get('/events/', options)
    end

    def bills(options = {})
      get('/bills/', options)
    end

    def votes(options = {})
      get('/votes/', options)
    end
  end
end
