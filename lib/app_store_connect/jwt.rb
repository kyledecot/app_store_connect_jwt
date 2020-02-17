require 'jwt'
require 'app_store_connect/jwt/version'

module AppStoreConnect 
  class JWT
    AUDIENCE = 'appstoreconnect-v1'
    ALGORITHM = 'ES256'

		attr_reader :issuer_id, :key_id, :private_key

    def initialize(issuer_id:, key_id:, private_key_path:)
      @issuer_id = issuer_id
      @key_id = key_id
      @private_key = OpenSSL::PKey.read(File.read(File.expand_path(private_key_path)))
    end 

		def payload
			{
				exp: Time.now.to_i + 20 * 60,
				iss: issuer_id,
				aud: AUDIENCE
			}
		end

		def header_fields
			{ kid: key_id }
		end

		def to_s
			::JWT.encode(payload, private_key, ALGORITHM, header_fields)
		end
  end 
end 
