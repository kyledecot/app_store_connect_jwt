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
      def self.encode(payload, private_key, algorithm, header_fields)
        ::JWT.encode(payload, private_key, algorithm, header_fields)
      end

      # @param token [String]
      # @param private_key [OpenSSL::PKey::EC]
      # @param algorithm [String]
      # @return [Array<Hash>]
      def self.decode(token, private_key, algorithm)
        ::JWT.decode(token, private_key, true, algorithm: algorithm)
      end

      # @param path [String]
      # @return [OpenSSL::PKey::EC]
      def self.private_key(path:)
        OpenSSL::PKey.read(File.read(File.expand_path(path)))
      end
    end
  end
end
