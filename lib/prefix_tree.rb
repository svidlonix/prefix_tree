require_relative 'node'
require 'byebug'

class PrefixTree
  def initialize()
    @head = Node.new('*')
  end

  def list
    array_char = []
    array_words = []
    get_words(@head, array_char, array_words)

    array_words
  end

  def add(word)
    head_node = @head
    list_of_chars = word.split('')

    list_of_chars.each do |char|
      last_char = last_char?(list_of_chars[-1], char)
      head_node = add_node(char, last_char, head_node)
    end
  end

  def include?(word)
    nodes_include?(word.split(''), @head)
  end

  private

  def get_words(head_node, array_chars, array_words)
    head_node.children.each do |node|
      array_chars << node.char
      array_words << array_chars.join if node.leaf
      get_words(node, array_chars, array_words)
      array_chars = []
    end
  end

  def last_char?(last_char, char)
    last_char == char
  end

  def nodes_include?(array_chars, word_tree)
    return true if array_chars.empty? && word_tree.leaf
    node = word_tree.children.select { |obj| obj.char == array_chars.first }

    if node.empty?
      return false
    else
      nodes_include?(array_chars.drop(1), node.first)
    end
  end

  def add_node(char, last_char, head_node)
    node = head_node.children.select { |obj| obj.char == char }.first

    if node.nil?
      node = Node.new(char, last_char)
      head_node.children << node
    end

    node.leaf = true if last_char
    node
  end
end
