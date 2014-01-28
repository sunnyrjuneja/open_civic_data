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
      get('/jurisdictions', options)
    end
  end
end
