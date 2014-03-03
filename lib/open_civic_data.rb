require 'open_civic_data/client'

module OpenCivicData
  extend self # rubocop:disable ModuleFunction
  attr_accessor :key

  # Alias for OpenCivicData::Client.new
  # @api public
  # @example
  #   OpenCivicData.new(SUNLIGHT_KEY)
  # @return [OpenCivicData::Client]
  def new(key = key)
    yield self if block_given?
    return @client if instance_variable_defined?(:@client) && @client.key == key
    @client = OpenCivicData::Client.new(key)
  end

  # Delegate to OpenCivicData::Client
  # @api public
  # @example
  #   OpenCivicData.jurisdictions
  def method_missing(method, *args, &block)
    if OpenCivicData::Client.respond_to?(method)
      OpenCivicData::Client.send(method, *args, &block)
    elsif new.respond_to?(method)
      new.send(method, *args, &block)
    else
      super
    end
  end

  # return [Boolean]
  def respond_to_missing?(method_name, include_private = false) new.respond_to?(method_name, include_private) end # rubocop:disable SingleLineMethods
end
