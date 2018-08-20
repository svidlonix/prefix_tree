require 'byebug'

# TODO: add descriptin class
class Node
  def add(char, pased_chars, last_char)
    (pased_chars + [char]).inject($prefix_tree) { |h, k| h[k] ||= last_char }
  end

  def nodes_present?(array_chars)
    value_char = $prefix_tree.dig(*array_chars)
    last?(value_char)
  end

  private

  def last?(value_char)
    !value_char[:last_char].nil?
  end
end
