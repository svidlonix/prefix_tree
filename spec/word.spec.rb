require 'spec_helper'
require 'byebug'

describe Word do
  let(:word) { Word.new('cat') }

  describe '#add' do
    before { word.add }

    it { expect($prefix_tree).to eq('c' => { 'a' => { 't' => {} } }) }
  end

  describe '#include?' do
    it { expect(word.include?).to eq('cat') }
  end

  describe '#list' do
    it { expect(word.list).to eq('cat') }
  end
end
