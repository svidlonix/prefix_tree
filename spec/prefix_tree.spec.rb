require 'spec_helper'
require 'byebug'

describe PrefixTree do

  describe '#add' do
    let(:prefix_tree) { PrefixTree.new }

    before { prefix_tree.add('cat') }

    it { expect(prefix_tree.instance_variable_get(:@head).children.first.children.first.children.first.char).to eq('t') }
    it { expect(prefix_tree.instance_variable_get(:@head).children.first.children.first.char).to eq('a') }
    it { expect(prefix_tree.instance_variable_get(:@head).children.first.char).to eq('c') }
    it { expect(prefix_tree.instance_variable_get(:@head).char).to eq('*') }
  end

  describe '#include?' do
    let(:prefix_tree) { PrefixTree.new }

    before { prefix_tree.add('catty') }

    context 'when word include' do
      it { expect(prefix_tree.include?('catty')).to eq(true) }
    end

    context 'when word not include' do
      it { expect(prefix_tree.include?('dog')).to eq(false) }
    end

    context 'when word have similar letters' do
      it { expect(prefix_tree.include?('cat')).to eq(false) }
    end
  end

  describe '#delete' do
    let(:prefix_tree) { PrefixTree.new }

    before do
      prefix_tree.add('cat')
      prefix_tree.add('dog')
      prefix_tree.add('rebbit')
      prefix_tree.delete('rebbit')
    end

    it { expect(prefix_tree.list).to eq(%w[cat dog]) }
  end

  describe '#list' do
    let(:prefix_tree) { PrefixTree.new }

    before do
      prefix_tree.add('catty')
      prefix_tree.add('cat')
    end

    it { expect(prefix_tree.list).to eq(%w[cat catty]) }
  end
end
