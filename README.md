# App Store Connect–JWT

![Test](https://github.com/kyledecot/app_store_connect_jwt/workflows/Test/badge.svg) ![Lint](https://github.com/kyledecot/app_store_connect_jwt/workflows/Lint/badge.svg) [![Gem Version](https://badge.fury.io/rb/app_store_connect_jwt.svg)](https://badge.fury.io/rb/app_store_connect_jwt) [![Maintainability](https://api.codeclimate.com/v1/badges/e13c94f97898e74f34a9/maintainability)](https://codeclimate.com/github/kyledecot/hard_cider/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/e13c94f97898e74f34a9/test_coverage)](https://codeclimate.com/github/kyledecot/hard_cider/test_coverage)

Generate App Store Connect API JWT (JSON Web Token) according to Apple's App Store Connect API Documentation:

https://developer.apple.com/documentation/appstoreconnectapi/generating_tokens_for_api_requests

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'app_store_connect_jwt'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install app_store_connect_jwt

## Usage

### CLI 

```sh
$ app-store-connect-jwt generate \
  --issuer-id=$APP_STORE_CONNECT_ISSUER_ID \
  --key-id=$APP_STORE_CONNECT_KEY_ID \
  --private-key-path=$APP_STORE_CONNECT_PRIVATE_KEY_PATH
```

_Pro Tip: if you have the environment variables set that are listed above you can omit the flags entirely and the CLI will automatically pick up on them, thus making the command `app-store-connect-jwt generate`!_

#### cURL 

```sh
$ curl -H "Authorization: Bearer $(app-store-connect-jwt generate)" \
  https://api.appstoreconnect.apple.com/v1/apps
```

### Ruby

```ruby 
puts AppStoreConnect::JWT.new(
  issuer_id: ENV["APP_STORE_CONNECT_ISSUER_ID"],
  key_id: ENV["APP_STORE_CONNECT_KEY_ID"],
  private_key_path: ENV["APP_STORE_CONNECT_PRIVATE_KEY_PATH"]
).token
```

_Pro Tip: `#token` is aliased to `#to_s` so in this example the `.token` is superfolus!_

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kyledecot/app_store_connect_jwt.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
