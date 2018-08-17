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
      Node.new(char).add(pased_chars)
      pased_chars << char
    end
  end

  def include?
    # TODO: implement method
    @word
  end

  def list
    # TODO: implement method
    @word
  end
end
