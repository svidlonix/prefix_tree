require 'spec_helper'

describe Node do
  let(:node) { Node.new('a') }
  subject { file }

  describe '#add' do
    it { expect(node.add).to eq('a') }
  end

  describe '#last?' do
    it { expect(node.last?).to eq('a') }
  end

  describe '#get' do
    it { expect(node.get).to eq('a') }
  end
end
