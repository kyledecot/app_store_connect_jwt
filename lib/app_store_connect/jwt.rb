# frozen_string_literal: true

require 'jwt'
require 'app_store_connect/jwt/version'

module AppStoreConnect
  class JWT
    AUDIENCE = 'appstoreconnect-v1'
    ALGORITHM = 'ES256'

    attr_reader :issuer_id, :key_id, :private_key

    # @param issuer_id [String]
    # @param key_id [String]
    # @param private_key_path [String]
    def initialize(issuer_id:, key_id:, private_key_path:)
      @issuer_id = issuer_id
      @key_id = key_id
      @private_key = OpenSSL::PKey.read(File.read(File.expand_path(private_key_path)))
    end

    # @return [Hash]
    def payload
      {
        exp: Time.now.to_i + 20 * 60,
        iss: issuer_id,
        aud: AUDIENCE
      }
    end

    # @return [Hash]
    def header_fields
      { kid: key_id }
    end

    # @return [String]
    def token
      ::JWT.encode(payload, private_key, ALGORITHM, header_fields)
    end

    alias to_s token
  end
end
