require_relative 'node'
require 'byebug'

class Tree
  def initialize(word)
    @word = word
  end

  def self.list
    array_char = []
    array_words = []
    knit_nodes($prefix_tree.first, array_char, array_words)

    array_words
  end

  def add
    tree = $prefix_tree.first
    list_of_chars = @word.split('')

    list_of_chars.each do |char|
      tree = Node.new(char).add(tree, last_char?(list_of_chars[-1], char))
    end
  end

  def include?
    tree = $prefix_tree.first
    Node.nodes_include?(@word.split(''), tree)
  end

  private

  def self.knit_nodes(tree, array_chars, array_words)
    tree.children.each do |node|
      array_chars << node.char
      array_words << array_chars.join if node.leaf
      knit_nodes(node, array_chars, array_words)
      array_chars = []
    end
  end

  def last_char?(last_char, char)
    last_char == char
  end
end
