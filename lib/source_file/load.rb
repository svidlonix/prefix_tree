require_relative 'base'

module SourceFile
  class Load < Base
    private

    def txt(prefix_tree, path = 'data/words')
      if File.exist?(txt_path(path))
        File.open(txt_path(path), 'r') do |f|
          f.each_line do |line|
            prefix_tree.add(line.strip)
          end
        end
      end
    end

    def zip(prefix_tree, path = 'data/words')
      delete_file_if_exists(txt_path(path))

      Zip::File.open(zip_path(path)) do |zipfile|
        zipfile.extract(File.basename(txt_path(path)), txt_path(path))
      end

      txt(prefix_tree, path)
      delete_file_if_exists(txt_path(path))
    end
  end
end
