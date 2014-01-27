require 'open_civic_data/client'

module OpenCivicData
  extend self
  attr_accessor :key

  def new(key = key)
    yield self if block_given?
    return @client if instance_variable_defined?(:@client) && @client.key == key
    @client = OpenCivicData::Client.new(key)
  end
end
