require 'gli'
require 'app_store_connect/jwt'

module AppStoreConnect
  class JWT 
    class CLI 
      extend GLI::App

      command :generate do |c|
        c.flag %i[issuer-id i], required: true, default_value: ENV["APP_STORE_CONNECT_ISSUER_ID"], mask: true
        c.flag %i[key-id k], required: true, default_value: ENV["APP_STORE_CONNECT_KEY_ID"], mask: true
        c.flag %i[private-key-path p], required: true, default_value: ENV["APP_STORE_CONNECT_PRIVATE_KEY_PATH"]

        c.action do |_, options, _|
          puts AppStoreConnect::JWT.new(
            issuer_id: options.fetch(:"issuer-id"),
            key_id: options.fetch(:"key-id"),
            private_key_path: options.fetch(:"private-key-path")
          )
        end 
      end
    end
  end 
end 
