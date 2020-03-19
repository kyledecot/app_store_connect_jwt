# App Store Connect–JWT

![Test](https://github.com/kyledecot/app_store_connect_jwt/workflows/Test/badge.svg)
![Lint](https://github.com/kyledecot/app_store_connect_jwt/workflows/Lint/badge.svg)
[![Gem Version](https://badge.fury.io/rb/app_store_connect_jwt.svg)](https://badge.fury.io/rb/app_store_connect_jwt)
[![Maintainability](https://api.codeclimate.com/v1/badges/e13c94f97898e74f34a9/maintainability)](https://codeclimate.com/github/kyledecot/app_store_connect_jwt/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/e13c94f97898e74f34a9/test_coverage)](https://codeclimate.com/github/kyledecot/app_store_connect_jwt/test_coverage)

Encode & decode App Store Connect API JWTs
(JSON Web Tokens) according to Apple's Documentation:

<https://developer.apple.com/documentation/appstoreconnectapi/generating_tokens_for_api_requests>

## Installation

### Bundler 

Add this line to your application's Gemfile:

```ruby
gem 'app_store_connect_jwt',
  require: 'app_store_connect/jwt'
```

And then execute:

```sh
$ bundle
```

### RubyGems

```sh
$ gem install app_store_connect_jwt
```

### Homebrew

```
$ brew tap kyledecot/tap
$ brew install app_store_connect_jwt
```

## Usage

Check out the [Wiki](https://github.com/kyledecot/app_store_connect_jwt/wiki)
for example usage.

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests. You can also run `rake console`
for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/kyledecot/app_store_connect_jwt>.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
