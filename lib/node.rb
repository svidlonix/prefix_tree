require 'byebug'

class Node
  def add(array_chars, tree)
    array_chars.each do |char|
      tree[char] ||= {}
      tree[char][:last_char] = true if array_chars[-1] == char
      tree = tree[char]
    end
  end

  def nodes_present?(array_chars)
    value_char = $prefix_tree.dig(*array_chars)
    last?(value_char)
  end

  def knit_nodes(tree, array_chars, array_words)
    tree.each do |key, value|
      if last_char?(key)
        array_words << array_chars.join
      else
        array_chars << key
        knit_nodes(value, array_chars, array_words)
      end
      array_chars.pop unless last_char?(key)
    end
  end

  private

  def last?(value_char)
    !value_char.nil? && !value_char[:last_char].nil?
  end

  def last_char?(key)
    key == :last_char
  end
end
