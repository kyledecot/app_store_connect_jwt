# frozen_string_literal: true

require 'gli'
require 'app_store_connect/jwt'

module AppStoreConnect
  class JWT
    class CLI
      extend GLI::App

      command :encode do |c|
        c.flag %i[issuer-id i], required: true, default_value: ENV['APP_STORE_CONNECT_ISSUER_ID'], mask: true
        c.flag %i[key-id k], required: true, default_value: ENV['APP_STORE_CONNECT_KEY_ID'], mask: true
        c.flag %i[private-key-path p], required: true, default_value: ENV['APP_STORE_CONNECT_PRIVATE_KEY_PATH']

        c.action do |_, options, _|
          puts AppStoreConnect::JWT.encode(
            issuer_id: options.fetch(:"issuer-id"),
            key_id: options.fetch(:"key-id"),
            private_key_path: options.fetch(:"private-key-path")
          )
        end
      end

      command :decode do |c|
        c.flag %i[token t], required: true
        c.flag %i[private-key-path p], required: true, default_value: ENV['APP_STORE_CONNECT_PRIVATE_KEY_PATH']

        c.action do |_, options, _|
          puts AppStoreConnect::JWT.decode(
            token: options.fetch(:token),
            private_key_path: options.fetch(:"private-key-path")
          )
        end
      end
    end
  end
end
