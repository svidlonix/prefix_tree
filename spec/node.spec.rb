require 'spec_helper'
require 'byebug'

describe Node do
  def node_new(char, leaf = false, children = [])
    Node.new(char, leaf, children)
  end

  describe '#add' do
    context 'when node present' do
      let(:child_node)  { node_new('b') }
      let(:parent_node) { node_new('a', false, [child_node]) }

      it { expect(node_new('b').add(parent_node)).to eq(child_node) }
    end

    context 'when node not present' do
      let(:parent_node) { node_new('b') }
      let(:new_node)    { node_new('c') }

      it { expect(new_node.add(parent_node)).to eq(new_node) }
    end

    context 'when node not present and last' do
      let(:parent_node) { node_new('b') }
      let(:new_node)    { node_new('b', true) }

      it { expect(new_node.add(parent_node).leaf).to eq(new_node.leaf) }
    end
  end

  describe '.nodes_present?' do
    let(:child_node)   { node_new('y', true) }
    let(:parent_node1) { node_new('t', false, [child_node]) }
    let(:parent_node2) { node_new('t', false, [parent_node1]) }
    let(:parent_node3) { node_new('a', false, [parent_node2]) }
    let(:parent_node4) { node_new('c', false, [parent_node3]) }
    let(:first_node)   { node_new('*', false, [parent_node4]) }

    context 'when array of chars present' do
      it { expect(Node.nodes_include?(%w[c a t t y], first_node)).to eq(true) }
    end

    context 'when array of chars do not present' do
      it { expect(Node.nodes_include?(%w[d o g], first_node)).to eq(false) }
    end

    context 'when word have similar letters' do
      it { expect(Node.nodes_include?(%w[c a t], first_node)).to eq(false) }
    end
  end
end
