require 'byebug'

class Node
  attr_accessor :char, :children, :leaf

  def initialize(char, leaf = false, children = [])
    @char = char
    @children = children
    @leaf = leaf
  end

  def self.nodes_include?(array_chars, tree)
    return true if array_chars.empty? && tree.leaf
    node = tree.children.select { |obj| obj.char == array_chars.first }

    if node.empty?
      return false
    else
      nodes_include?(array_chars.drop(1), node.first)
    end
  end

  def add(tree, leaf)
    node = tree.children.select { |obj| obj.char == @char }.first

    if node.nil?
      node = Node.new(@char, leaf)
      tree.children << node
    end

    node
  end
end
