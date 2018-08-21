require 'spec_helper'

describe Node do
  let(:node) { Node.new }
  let(:expected_result) { { 'c' => { 'a' => { 't' => { last_char: true } } } } }

  describe '#add' do
    context 'when firt word' do
      before { node.add(%w[c a t], $prefix_tree) }

      it { expect($prefix_tree).to eq(expected_result) }
    end

    context 'when second world with similar words' do
      let(:expected_result) do
        { 'c' => { 'a' => { 't' => { 't' => { 'y' => { last_char: true } }, last_char: true } } } }
      end

      before do
        Word.new('catty').add
        node.add(%w[c a t], $prefix_tree)
      end

      it { expect($prefix_tree).to eq(expected_result) }
    end
  end

  describe '#nodes_present?' do
    let(:word) { Word.new('catty') }

    before { word.add }

    context 'when array of chars present' do
      it { expect(node.nodes_present?(%w[c a t t y])).to eq(true) }
    end

    context 'when array of chars not present' do
      it { expect(node.nodes_present?(%w[c a t])).to eq(false) }
    end
  end

  describe '#knit_nodes' do
    let(:array_chars) { [] }
    let(:array_words) { [] }

    before do
      Word.new('catty').add
      Word.new('cat').add
      Word.new('post').add
      Word.new('push').add
      node.knit_nodes($prefix_tree, array_chars, array_words)
    end

    it { expect(array_words).to eq(%w[catty cat post push]) }
  end
end
