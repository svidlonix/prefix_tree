require_relative 'load_save_file'
require_relative 'node'
require_relative 'word'
require 'byebug'

$prefix_tree = {}

loop do
  input = gets.chomp
  _, *params = input.split(/\s/)
  case input
  when /add/
    if Word.new(*params).include?
      puts('this word exist')
    else
      Word.new(*params).add
      puts('added')
    end
  when /include?/
    puts(Word.new(*params).include?)
  when /list/
    list_of_words = Word.new.list
    if list_of_words.empty?
      puts('There are no words')
    else
      puts('List of words:')
      puts(list_of_words)
    end
  when /load file/
    LoadSaveFile.load
    puts('file loaded')
  when /save file/
    LoadSaveFile.save
    puts('file saved')
  when /exit/
    return
  else
    puts 'Invalid command'
  end
end
