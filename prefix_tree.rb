require_relative 'lib/source_file/load'
require_relative 'lib/source_file/save'
require_relative 'lib/source_file/base'
require_relative 'lib/node'
require_relative 'lib/prefix_tree'
require 'byebug'

puts('___________________________________________')
puts('')
puts('Welcome in the Prefix Tree')
puts('')
puts("If you need help, please use command 'help'")
puts("If you want exit, please use command 'exit'")
puts('___________________________________________')

prefix_tree = PrefixTree.new

loop do
  input = gets.chomp
  _, *params = input.split(/\s/)
  case input
  when /add/
    if prefix_tree.include?(*params)
      puts('this word exist')
    else
      prefix_tree.add(*params)
      puts('added')
    end
  when /include?/
    puts(prefix_tree.include?(*params))
  when /list/
    list_of_words = prefix_tree.list
    if list_of_words.empty?
      puts('There are no words')
    else
      puts('List of words:')
      puts(list_of_words)
    end
  when /save/
    SourceFile::Save.new.call(*params, prefix_tree)
  when /load/
    SourceFile::Load.new.call(*params, prefix_tree)
  when /exit/
    return
  when /help/
    puts('')
    puts('_____________________________________________________________________________')
    puts('The list of command you can use in Prefix Tree')
    puts('')
    puts("'add <word>'                            use for add new word")
    puts("'include? <word>'                       to check presence word in Prefix Tree")
    puts("'list'                                  get list all words in Prefix Tree")
    puts("'load <path_to_file> [--<format_file>]' load all worlds from words.txt file")
    puts("'save <path_to_file> [--<format_file>]' save all worlds to words.txt file")
    puts('')
    puts('_____________________________________________________________________________')
  else
    puts 'Invalid command'
  end
end
