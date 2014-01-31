# Ruby wrapper for the Open Civic Data API

The Open Civic Data API is a JSON API that provides search and lookup across all information captured by the project, provided by the Sunlight Foundation.

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
