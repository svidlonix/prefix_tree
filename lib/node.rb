require 'byebug'

class Node
  attr_accessor :char, :children, :leaf

  def initialize(char, leaf = false, children = [])
    @char = char
    @children = children
    @leaf = leaf
  end
end
