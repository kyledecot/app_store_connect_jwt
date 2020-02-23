# App Store Connect–JWT

![Test](https://github.com/kyledecot/app_store_connect_jwt/workflows/Test/badge.svg) ![Lint](https://github.com/kyledecot/app_store_connect_jwt/workflows/Lint/badge.svg) [![Gem Version](https://badge.fury.io/rb/app_store_connect_jwt.svg)](https://badge.fury.io/rb/app_store_connect_jwt) [![Maintainability](https://api.codeclimate.com/v1/badges/e13c94f97898e74f34a9/maintainability)](https://codeclimate.com/github/kyledecot/app_store_connect_jwt/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/e13c94f97898e74f34a9/test_coverage)](https://codeclimate.com/github/kyledecot/app_store_connect_jwt/test_coverage)

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

#### Encoding 

```sh
$ app-store-connect-jwt encode \
    --issuer-id=$APP_STORE_CONNECT_ISSUER_ID \
    --key-id=$APP_STORE_CONNECT_KEY_ID \
    --private-key-path=$APP_STORE_CONNECT_PRIVATE_KEY_PATH
```

:information_desk_person: _Pro Tip: if you have the environment variables set that are listed above you can omit the flags entirely and the CLI will automatically pick up on them, thus making the command `app-store-connect-jwt encode`!_

#### Decoding

```sh
$ app-store-connect-jwt decode \
    --token="..." \
    --private-key-path=$APP_STORE_CONNECT_PRIVATE_KEY_PATH
```

#### cURL 

```sh
$ curl -H "Authorization: Bearer $(app-store-connect-jwt encode)" \
    https://api.appstoreconnect.apple.com/v1/apps
```

### Ruby

#### Encoding

```ruby 
require 'app_store_connect/jwt'

puts AppStoreConnect::JWT.encode(
  issuer_id: ENV["APP_STORE_CONNECT_ISSUER_ID"],
  key_id: ENV["APP_STORE_CONNECT_KEY_ID"],
  private_key_path: ENV["APP_STORE_CONNECT_PRIVATE_KEY_PATH"]
)
```

#### Decoding

```ruby
require 'app_store_connect/jwt'

puts AppStoreConnect::JWT.decode(
  token: token,
  private_key_path: ENV["APP_STORE_CONNECT_PRIVATE_KEY_PATH"]
)
```

#### Net::HTTP

```ruby
require 'app_store_connect/jwt'
require 'net/http'

uri = URI('https://api.appstoreconnect.apple.com/v1/apps')
jwt = AppStoreConnect::JWT.encode(
  issuer_id: ENV['APP_STORE_CONNECT_ISSUER_ID'],
  key_id: ENV['APP_STORE_CONNECT_KEY_ID'],
  private_key_path: ENV['APP_STORE_CONNECT_PRIVATE_KEY_PATH']
)

request = Net::HTTP::Get.new(uri)
request['Authorization'] = "Bearer #{jwt}"

response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
  http.request(request)
end

puts response.body
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kyledecot/app_store_connect_jwt.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
