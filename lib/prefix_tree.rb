require_relative 'load_save_file'
require_relative 'node'
require_relative 'word'
require 'byebug'

$prefix_tree = {}
puts('___________________________________________')
puts('')
puts('Welcome in the Prefix Tree')
puts('')
puts("If you need help, please use command 'help'")
puts("If you want exit, please use command 'exit'")
puts('___________________________________________')

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
  when /save zip file/
    LoadSaveFile.save_to_zip
    puts('zip file saved')
  when /load zip file/
    LoadSaveFile.load_from_zip
    puts('zip file loaded')
  when /exit/
    return
  when /help/
    puts('')
    puts('_________________________________________________________')
    puts('The list of command you can use in Prefix Tree')
    puts('')
    puts("'add <word>'      use for add new word")
    puts("'include? <word>' to check presence word in Prefix Tree")
    puts("'list'            get list all words in Prefix Tree")
    puts("'load file'       load all worlds from words.txt file")
    puts("'save file'       save all worlds to words.txt file")
    puts("'load zip file'   load all worlds from words.zip zip file")
    puts("'save zip file'   save all worlds to words.zip zip file")
    puts('')
    puts('_________________________________________________________')
  else
    puts 'Invalid command'
  end
end
