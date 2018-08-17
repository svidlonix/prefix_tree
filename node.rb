require 'byebug'

# TODO: add descriptin class
class Node
  def initialize(char)
    @char = char
  end

  def add(pased_chars)
    node = {}

    (pased_chars + [@char]).inject($prefix_tree) { |h, k| h[k] ||= {} }
  end

  def last?
    # TODO: implement method
    @char
  end

  def get
    # TODO: implement method
    @char
  end
end
