# frozen_string_literal: true

RSpec.describe AppStoreConnect::JWT::Utils do
  describe '.encode' do
    pending
  end

  describe '.decode' do
    it 'should return an array' do
      expected = [
        { 'exp' => 1_582_475_045, 'iss' => issuer_id, 'aud' => AppStoreConnect::JWT::AUDIENCE },
        { 'kid' => 'M3225B466N', 'alg' => AppStoreConnect::JWT::ALGORITHM }
      ]
      actual = described_class.decode(
        jwt,
        described_class.private_key(private_key_path),
        AppStoreConnect::JWT::ALGORITHM
      )

      expect(actual).to match_array(expected)
    end
  end

  describe '.private_key' do
    it 'should return a OpenSSL::PKey::EC' do
      expect(described_class.private_key(private_key_path)).to be_a(OpenSSL::PKey::EC)
    end
  end
end
