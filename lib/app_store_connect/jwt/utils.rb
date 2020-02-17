# frozen_string_literal: true

require 'jwt'

module AppStoreConnect
  class JWT
    module Utils
      # @param payload [Hash]
      # @param private_key [OpenSSL::PKey::EC]
      # @param algorithm [String]
      # @param header_fields [Hash]
      # @return [String]
      def self.encode(payload, private_key, _algorithm, header_fields)
        ::JWT.encode(payload, private_key, ALGORITHM, header_fields)
      end
    end
  end
end
