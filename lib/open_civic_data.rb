require 'open_civic_data/client'

module OpenCivicData
  extend self # rubocop:disable ModuleFunction
  attr_accessor :key

  # Alias for OpenCivicData::Client.new
  #
  # @return [OpenCivicData::Client]
  def new(key = key)
    yield self if block_given?
    return @client if instance_variable_defined?(:@client) && @client.key == key
    @client = OpenCivicData::Client.new(key)
  end

  # Delegate to OpenCivicData::Client
  def method_missing(method, *args, &block)
    return super unless new.respond_to?(method)
    new.send(method, *args, &block)
  end

  # return [Boolean]
  def respond_to_missing?(method_name, include_private = false) new.respond_to?(method_name, include_private) end # rubocop:disable SingleLineMethods
end
