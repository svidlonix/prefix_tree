require 'spec_helper'
require 'byebug'

describe Tree do
  let(:word) { Tree.new('catty') }

  describe '#add' do
    let(:expected_result) { { 'c' => { 'a' => { 't' => { 't' => { 'y' => { last_char: true } } } } } } }

    before { word.add }

    it { expect($prefix_tree).to eq(expected_result) }
  end

  describe '#include?' do
    before { word.add }

    context 'when word include' do
      it { expect(word.include?).to eq(true) }
    end

    context 'when word not include' do
      let(:word_not_include) { Tree.new('cat') }

      it { expect(word_not_include.include?).to eq(false) }
    end
  end

  describe '#list' do
    let(:word2) { Tree.new('cat') }

    before do
      word.add
      word2.add
    end

    it { expect(Tree.new.list).to eq(%w[catty cat]) }
  end
end
