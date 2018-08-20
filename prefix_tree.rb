require_relative 'load_save_file'
require_relative 'node'
require_relative 'word'

$prefix_tree = {}

loop do
  input = gets.chomp
  command, *params = input.split /\s/

  case command
  when 'add'
    Word.new(*params).add
    puts($prefix_tree)
    puts('added')
  when 'include?'
    puts(Word.new(*params).include?)
  when 'get'
    puts 'get'
  else
    puts 'Invalid command'
  end
end
