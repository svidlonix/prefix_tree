require 'spec_helper'

describe Word do
  let(:node) { Word.new('cat') }
  subject { file }

  describe '#add' do
    it { expect(node.add).to eq('cat') }
  end

  describe '#include?' do
    it { expect(node.include?).to eq('cat') }
  end

  describe '#list' do
    it { expect(node.list).to eq('cat') }
  end
end
