require 'zip'

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
    if File.exist?(file_name)
      File.open(file_name, 'r') do |f|
        f.each_line do |line|
          Word.new(line.strip).add
        end
      end
    end
  end

  def self.save_to_zip(file_name = 'data/words.txt', zipfile_name = 'data/words.zip')
    save(file_name)
    File.delete(zipfile_name) if File.exist?(zipfile_name)

    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      zipfile.add(File.basename(file_name), file_name)
    end

    File.delete(file_name) if File.exist?(file_name)
  end

  def self.load_from_zip(file_name = 'data/words.txt', zipfile_name = 'data/words.zip')
    File.delete(file_name) if File.exist?(file_name)

    Zip::File.open(zipfile_name) do |zip_file|
      zip_file.extract(File.basename(file_name), file_name)
    end

    load(file_name)
    File.delete(file_name) if File.exist?(file_name)
  end
end
