# encoding: utf-8
require File.expand_path('../lib/open_civic_data/version', __FILE__)

Gem::Specification.new do |spec|
  spec.add_dependency 'faraday', '~> 0.8.7'
  spec.add_dependency 'faraday_middleware', '~> 0.9.0'
  spec.add_dependency 'hashie', '~> 2.0'
  spec.add_dependency 'json', '~> 1.8'
  spec.add_dependency 'rash', '~> 0.4'
  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.author        = 'Sunny Juneja'
  spec.description   = %q{Ruby wrapper for the Sunlight Open Civic Data API, is an collaborative effort to define schemas and provide tools for gathering information on government organizations, people, legislation, and events provided by the Sunlight Foundation.}
  spec.email         = 'me@sunnyjuneja.com'
  spec.files         = `git ls-files`.split("\n")
  spec.homepage      = 'https://github.com/whatasunnyday/open_civic_data'
  spec.licenses      = ['MIT']
  spec.name          = 'open_civic_data'
  spec.require_paths = ['lib']
  spec.summary       = %q{Ruby wrapper for the Sunlight Open Civic Data API}
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.version       = OpenCivicData::VERSION
end
