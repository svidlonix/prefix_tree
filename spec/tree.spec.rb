require 'spec_helper'
require 'byebug'

describe Tree do
  def node_new(char, leaf = false, children = [])
    Node.new(char, leaf, children)
  end

  describe '#add' do
    before { Tree.new('cat').add }

    it { expect($prefix_tree.first.children.first.children.first.children.first.char).to eq('t') }
    it { expect($prefix_tree.first.children.first.children.first.char).to eq('a') }
    it { expect($prefix_tree.first.children.first.char).to eq('c') }
    it { expect($prefix_tree.first.char).to eq('*') }
  end

  describe '#include?' do
    before { Tree.new('catty').add }

    context 'when word include' do
      it { expect(Tree.new('catty').include?).to eq(true) }
    end

    context 'when word not include' do
      it { expect(Tree.new('dog').include?).to eq(false) }
    end

    context 'when word have similar letters' do
      it { expect(Tree.new('cat').include?).to eq(false) }
    end
  end

  describe '.list' do
    before do
      Tree.new('catty').add
      Tree.new('cat').add
    end

    it { expect(Tree.list).to eq(%w[cat catty]) }
  end
end
