# frozen_string_literal: true

RSpec.describe AppStoreConnect::JWT do
  let(:private_key_path) { File.expand_path(File.join(__dir__, '../support/fixtures/private_key.p8')) }
  let(:key_id) { 'M3225B466N' }
  let(:issuer_id) { '69a6de70-03db-47e3-e053-5b8c7c11a4d1' }

  subject(:authorization) do
    described_class.new(
      issuer_id: issuer_id,
      key_id: key_id,
      private_key_path: private_key_path
    )
  end

  describe '#payload' do
    around do |example|
      Timecop.freeze(Time.parse('2019-01-01 00:00:00 UTC')) do
        example.call
      end
    end

    it 'should return a hash' do
      expect(authorization.payload).to eq(
        aud: described_class::AUDIENCE,
        exp: 1_546_302_000,
        iss: issuer_id
      )
    end
  end

  describe '#token' do
    around do |example|
      Timecop.freeze(Time.parse('2019-01-01 00:00:00 UTC')) do
        example.call
      end
    end

    subject(:token) { authorization.token }

    let(:segments) { JWT.decode(token, OpenSSL::PKey.read(File.read(private_key_path)), true, algorithm: described_class::ALGORITHM) }
    let(:payload) { segments.first }
    let(:options) { segments.last }

    it 'should return a decodable JSON web token' do
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

  describe '#to_s' do
    it 'should be aliased to #token' do
      expect(authorization.method(:to_s)).to eq(authorization.method(:token))
    end
  end
end
