require_relative 'base'

module SourceFile
  class Save < Base
    private

    def txt(prefix_tree, path = 'data/words')
      delete_file_if_exists(txt_path(path))
      File.open(txt_path(path), 'w') do |f|
        prefix_tree.list.each do |word|
          f.write("#{word}\n")
        end
      end
    end

    def zip(prefix_tree, path = 'data/words')
      txt(prefix_tree, path)
      delete_file_if_exists(zip_path(path))

      Zip::File.open(zip_path(path), Zip::File::CREATE) do |zipfile|
        zipfile.add(File.basename(txt_path(path)), txt_path(path))
      end

      delete_file_if_exists(txt_path(path))
    end
  end
end
