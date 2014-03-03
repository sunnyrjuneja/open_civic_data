require 'faraday_middleware'

module OpenCivicData
  module Connection
# rubocop:disable EmptyLinesAroundBody

  private

    def connection
      @connection ||= create_connection
    end

    def create_connection
      Faraday.new(url: OpenCivicData.endpoint) do |connection|
        middlewares.each { |middleware| connection.use(middleware) }
        connection.adapter(Faraday.default_adapter)
      end
    end

    def middlewares
      [Faraday::Request::UrlEncoded,
       Faraday::Response::RaiseError,
       Faraday::Response::Rashify,
       Faraday::Response::ParseJson]
    end
  end
end
