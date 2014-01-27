module OpenCivicData
  class Client
    attr_reader :key

    def initialize(key)
      fail ArgumentError, 'API key required' if key.nil?
      @key = key
    end
  end
end
