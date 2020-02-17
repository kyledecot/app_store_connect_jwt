# frozen_string_literal: true

RSpec.describe AppStoreConnect::JWT do
  subject(:jwt) do
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
      expect(jwt.payload).to eq(
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

    subject(:token) { jwt.token }

    let(:segments) { described_class.decode(token: token, private_key_path: private_key_path) }
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
      expect(jwt.method(:to_s)).to eq(jwt.method(:token))
    end
  end
end
