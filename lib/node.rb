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

  def add(tree)
    node = tree.children.select { |obj| obj.char == @char }.first
    tree.children << node = self if node.nil?
    node.leaf = true if leaf

    node
  end
end
