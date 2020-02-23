# frozen_string_literal: true

RSpec.describe AppStoreConnect::JWT do
  let(:algorithm) { described_class::ALGORITHM }
  let(:audience) { described_class::AUDIENCE }
  let(:private_key) { described_class::Utils.private_key(private_key_path) }

  describe '.encode' do
    let(:header_fields) { described_class::Utils.header_fields(key_id) }
    let(:payload) { { aud: audience, exp: 1_546_302_000, iss: issuer_id } }

    it 'should delegate' do
      expect(described_class::Utils)
        .to receive(:encode)
        .with(payload, instance_of(OpenSSL::PKey::EC), algorithm, header_fields)

      described_class.encode(
        issuer_id: issuer_id,
        key_id: key_id,
        private_key_path: private_key_path
      )
    end
  end

  describe '.decode' do
    it 'should delegate' do
      expect(described_class::Utils)
        .to receive(:decode)
        .with(jwt, instance_of(OpenSSL::PKey::EC), algorithm)

      described_class.decode(token: jwt, private_key_path: private_key_path)
    end
  end
end
