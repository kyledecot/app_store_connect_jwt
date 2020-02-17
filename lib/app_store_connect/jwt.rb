# frozen_string_literal: true

require 'app_store_connect/jwt/utils'
require 'app_store_connect/jwt/version'

module AppStoreConnect
  class JWT
    AUDIENCE = 'appstoreconnect-v1'
    ALGORITHM = 'ES256'

    # App Store Connect API Issuer ID
    # @return [String]
    attr_reader :issuer_id

    # App Store Connect API Key ID
    # @return [String]
    attr_reader :key_id

    # App Store Connect API Private Key
    # @return [OpenSSL::PKey::EC]
    attr_reader :private_key

    # @param token [String]
    # @param private_key_path [String] Path to App Store Connect API Private Key (.p8)
    # @return [Array<Hash>]
    def self.decode(token:, private_key_path:)
      private_key = private_key_for(path: private_key_path)

      Utils.decode(token, private_key, ALGORITHM)
    end

    # @param issuer_id [String] App Store Connect API Issuer ID
    # @param key_id [String] App Store Connect API Key ID
    # @param private_key_path [String] Path to App Store Connect API Private Key (.p8)
    def initialize(issuer_id:, key_id:, private_key_path:)
      @issuer_id = issuer_id
      @key_id = key_id
      @private_key = self.class.private_key_for(path: private_key_path)
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
      Utils.encode(payload, private_key, ALGORITHM, header_fields)
    end

    alias to_s token

    def self.private_key_for(path:)
      OpenSSL::PKey.read(File.read(File.expand_path(path)))
    end
    private_class_method :private_key_for
  end
end
