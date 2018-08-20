require 'spec_helper'
require 'byebug'

describe Word do
  let(:word) { Word.new('catty') }

  describe '#add' do
    before { word.add }

    it { expect($prefix_tree).to eq('c' => { 'a' => { 't' => { 't' => { 'y' => { last_char: true } } } } }) }
  end

  describe '#include?' do
    before { word.add }

    context 'when word include' do
      it { expect(word.include?).to eq(true) }
    end

    context 'when word not include' do
      let(:word_not_include) { Word.new('cat') }

      it { expect(word_not_include.include?).to eq(false) }
    end
  end

  describe '#list' do
    it { expect(word.list).to eq('catty') }
  end
end
