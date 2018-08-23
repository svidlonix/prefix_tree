require_relative 'node'
require 'byebug'

class Word
  def initialize(word = nil)
    @word = word
  end

  def add
    array_chars = @word.split('')
    Node.new.add(array_chars, $prefix_tree)
  end

  def include?
    array_chars = @word.split('')
    Node.new.nodes_present?(array_chars)
  end

  def list
    array_char = []
    array_words = []
    Node.new.knit_nodes($prefix_tree, array_char, array_words)

    array_words
  end

  private

  def last_char(char)
    @word[-1] == char ? { last_char: true } : {}
  end
end
