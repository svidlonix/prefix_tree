# TODO: add descriptin class
class LoadSaveFile
  def self.save(file_name = 'data/words.txt')
    File.delete(file_name) if File.exist?(file_name)
    list_of_words = Word.new.list

    File.open(file_name, 'w') do |f|
      list_of_words.each do |word|
        f.write("#{word}\n")
      end
    end
  end

  def self.load(file_name = 'data/words.txt')
    File.open(file_name, 'r') do |f|
      f.each_line do |line|
        Word.new(line.strip).add
      end
    end
  end

  def save_to_zip_file
    # TODO: implement method
    @file_name
  end

  def load_from_zip_file
    # TODO: implement method
    @file_name
  end
end
