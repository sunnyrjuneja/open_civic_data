# Ruby wrapper for the Open Civic Data API

[![Build Status](https://travis-ci.org/whatasunnyday/open_civic_data.png?branch=master)][travis]
[travis]: https://travis-ci.org/whatasunnyday/open_civic_data

The Open Civic Data API is a JSON API that provides search and lookup across government organizations, people, legislation, and events, provided by the Sunlight Foundation.

For more information, check the [API documentation](http://docs.opencivicdata.org/en/latest/index.html).

## Installation
    gem install open_civic_data

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
The (contributors)[https://github.com/codeforamerica/congress/graphs/contributors] of the (Congress gem)[https://github.com/codeforamerica/congress] where the ideas behind this gem largely lifted from.

## Copyright
Copyright (c) 2014, Sunny Juneja. See [LICENSE][] for details.

[license]: https://github.com/whatasunnyday/open_civic_data/blob/master/LICENSE.md
