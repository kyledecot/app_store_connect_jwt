# frozen_string_literal: true

RSpec.describe AppStoreConnect::JWT::Utils do
  let(:algorithm) { AppStoreConnect::JWT::ALGORITHM }
  let(:audience) { AppStoreConnect::JWT::AUDIENCE }
  let(:private_key) { described_class.private_key(private_key_path) }

  describe '.encode' do
    let(:payload) { described_class.payload(issuer_id, audience) }
    let(:header_fields) { described_class.header_fields(key_id) }

    it 'should delegate' do
      expect(::JWT).to receive(:encode).with(payload, private_key, algorithm, header_fields)

      described_class.encode(payload, private_key, algorithm, header_fields)
    end
  end

  describe '.decode' do
    it 'should return an array' do
      expected = [
        { 'exp' => 1_546_302_000, 'iss' => issuer_id, 'aud' => audience },
        { 'kid' => key_id, 'alg' => algorithm }
      ]
      actual = described_class.decode(jwt, private_key, algorithm)

      expect(actual).to match_array(expected)
    end
  end

  describe '.private_key' do
    it 'should return a OpenSSL::PKey::EC' do
      expect(private_key).to be_a(OpenSSL::PKey::EC)
    end
  end
end
