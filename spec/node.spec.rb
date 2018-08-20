require 'spec_helper'

describe Node do
  let(:node) { Node.new }

  describe '#add' do
    context 'went not last char' do
      before { node.add('a', [], {}) }

      it { expect($prefix_tree).to eq('a' => {}) }
    end

    context 'went not last char' do
      before { node.add('a', [], last_char: true) }

      it { expect($prefix_tree).to eq('a' => { last_char: true }) }
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
end
