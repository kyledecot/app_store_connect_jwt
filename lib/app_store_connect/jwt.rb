# frozen_string_literal: true

require 'app_store_connect/jwt/utils'
require 'app_store_connect/jwt/version'

module AppStoreConnect
  class JWT
    AUDIENCE = 'appstoreconnect-v1'
    ALGORITHM = 'ES256'

    # @param issuer_id [String] App Store Connect API Issuer ID
    # @param key_id [String] App Store Connect API Key ID
    # @param private_key_path [String] Path to App Store Connect API Private Key (.p8)
    def self.encode(issuer_id:, key_id:, private_key_path:)
      payload = {
        exp: Time.now.to_i + 20 * 60,
        iss: issuer_id,
        aud: AUDIENCE
      }
      header_fields = { kid: key_id }
      private_key = Utils.private_key(path: private_key_path)

      Utils.encode(payload, private_key, ALGORITHM, header_fields)
    end

    # @param token [String]
    # @param private_key_path [String] Path to App Store Connect API Private Key (.p8)
    # @return [Array<Hash>]
    def self.decode(token:, private_key_path:)
      private_key = Utils.private_key(path: private_key_path)

      Utils.decode(token, private_key, ALGORITHM)
    end
  end
end
