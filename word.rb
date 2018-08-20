require_relative 'node'
require 'byebug'

# TODO: add descriptin class
class Word
  def initialize(word = nil)
    @word = word
  end

  def add
    pased_chars = []

    @word.each_char do |char|
      last_char = last_char(char)
      Node.new.add(char, pased_chars, last_char)
      pased_chars << char
    end
  end

  def include?
    array_chars = @word.split('')
    Node.new.nodes_present?(array_chars)
  end

  def list
    # TODO: implement method
    @word
  end

  private

  def last_char(char)
    @word[-1] == char ? { last_char: true } : {}
  end
end
