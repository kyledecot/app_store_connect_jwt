# frozen_string_literal: true

RSpec.describe AppStoreConnect::JWT::Utils do
  describe '.encode' do
    pending
  end

  describe '.decode' do
    pending
  end

  describe '.private_key' do
    it 'should return a OpenSSL::PKey::EC' do
      expect(described_class.private_key(path: private_key_path)).to be_a(OpenSSL::PKey::EC)
    end
  end
end
