# frozen_string_literal: true

RSpec.describe AppStoreConnect::JWT::CLI do
  describe '.run' do
    context 'when command is `encode`' do
      it 'should not raise' do
        expect do
          described_class.run(['encode', "--private-key-path=#{private_key_path}"])
        end.to_not raise_error
      end
    end

    context 'when command is `decode`' do
      it 'should not raise' do
        expect do
          described_class.run(['decode', "--token=#{jwt}}", "--private-key-path=#{private_key_path}"])
        end.to_not raise_error
      end
    end
  end
end
