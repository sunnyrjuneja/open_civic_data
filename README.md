# Ruby wrapper for the Open Civic Data API

[![Build Status](https://travis-ci.org/whatasunnyday/open_civic_data.png?branch=master)](https://travis-ci.org/whatasunnyday/open_civic_data)
[travis]: https://travis-ci.org/whatasunnyday/open_civic_data

The Open Civic Data API is a JSON API that provides search and lookup across government organizations, people, legislation, and events, provided by the Sunlight Foundation.

For more information, check the [API documentation][apidocs]
[apidocs]: http://docs.opencivicdata.org/en/latest/index.html

## Installation
    gem install open_civic_data

## Documentation
[http://rdoc.info/github/whatasunnyday/open_civic_data/][documentation]
[documentation]: http://rdoc.info/github/whatasunnyday/open_civic_data/

## Authentication

All requests to the Open Civic Data API require a Sunlight API key. An API key is
[free to register][register] and has no usage limits.
[register]: http://services.sunlightlabs.com/accounts/register/

## Usage Examples

###### Setup
```ruby
require 'open_civic_data'
OpenCivicData.key = YOUR_SUNLIGHT_API_KEY
```

###### Fetches governing bodies in a division.
```ruby
OpenCivicData.jurisdictions
```

###### Fetches political geographies such as a state, county or congressional district.
```ruby
OpenCivicData.divisions
```

###### Fetches people, typically politicians or gov officials.
```ruby
OpenCivicData.people
```

###### Fetches groups of people, such as a city council, state senate or committee.
```ruby
OpenCivicData.organizations
```

###### Fetches legislative event, such as a meeting or hearing.
```ruby
OpenCivicData.events
```

###### Fetches legislative documents, resolutions, appointments, or contracts and its history.
```ruby
OpenCivicData.bills
```

###### Fetches the record of vote taken on motions. May contain individual legilsator's yay/nay or outcome.
```ruby
OpenCivicData.votes
```

###### All methods include an optional parameter to set search end points
```ruby
# Returns legislators named 'Obama'
OpenCivicData.people({'name' => 'Obama'})

# Returns second page of results (results are paginated && 0 indexed)
OpenCivicData.votes({'page' => 1 })
```

## Supported Ruby Versions
This library aims to support and is [tested against][travis] the following Ruby
implementations:

* Ruby 1.9.2
* Ruby 1.9.3
* Ruby 2.0.0
* Ruby 2.1.0

If something doesn't work on one of these interpreters, it should be considered
a bug.

This library may inadvertently work (or seem to work) on other Ruby
implementations, however support will only be provided for the versions listed
above.

If you would like this library to support another Ruby version, you may
volunteer to be a maintainer. Being a maintainer entails making sure all tests
run and pass on that implementation. When something breaks on your
implementation, you will be personally responsible for providing patches in a
timely fashion. If critical issues for a particular implementation exist at the
time of a major release, support for that Ruby version may be dropped.

## Special Thanks to
The [contributors][] of the [Congress gem][congress] where the ideas behind this gem were largely lifted from.
[contributors]: https://github.com/codeforamerica/congress/graphs/contributors
[congress]: https://github.com/codeforamerica/congress

## Copyright
Copyright (c) 2014, Sunny Juneja. See [LICENSE][] for details.
[license]: https://github.com/whatasunnyday/open_civic_data/blob/master/LICENSE.md
