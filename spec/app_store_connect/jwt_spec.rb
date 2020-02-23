# frozen_string_literal: true

RSpec.describe AppStoreConnect::JWT do
  describe '.encode' do
    around do |example|
    end

    subject(:token) { described_class.encode(key_id: key_id, issuer_id: issuer_id, private_key_path: private_key_path) }

    it 'should return a decodable JSON web token' do
      payload, options = described_class.decode(
        token: token,
        private_key_path: private_key_path
      )

      expect(options).to eq(
        'alg' => described_class::ALGORITHM,
        'kid' => key_id
      )

      expect(payload).to eq(
        'aud' => described_class::AUDIENCE,
        'exp' => 1_546_302_000,
        'iss' => issuer_id
      )
    end
  end
end
