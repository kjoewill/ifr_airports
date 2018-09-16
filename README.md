# IFR Airports

This application can be used to locate airports within any US state that support poor weather operations
by means of electronic navigation guidance.  Current weather information is also provided for these airports.

The appllication makes use of a web page: [Global Air](https://www.globalair.com) to find IFR-capable airports and a web service: [AVWX](https://avwx.rest) to retreive current weather information.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ifr_airports'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ifr_airports

## Usage

This application can be used to find airports within any US state that support poor weather operations via 
electronic navigation guidance.

After cloning this repo set your directory to "ifr_airports" and from the command line run "./bin/ifr-airports".  At this point you will be prompted for a US state name. Type in your chosed state 
at the prompt and hit "enter".  You will then be presented with a list of poor weather-capable airports in
the state. Choose an airport and type it's identifier at the prompt and hit "enter" to recive that airport's
most recent weather report.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'kjoewill'/ifr_airports. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the IfrAirports project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'kjoewill'/ifr_airports/blob/master/CODE_OF_CONDUCT.md).
