require 'zip'
require_relative '../prefix_tree'

module SourceFile
  class Base
    def call(path, format, prefix_tree)
      case format
      when /txt/
        txt(prefix_tree, path.delete('"'))
      when /zip/
        zip(prefix_tree, path.delete('"'))
      end
    rescue Errno::ENOENT => e
      puts(e.message)
    end

    protected

    def delete_file_if_exists(filename)
      File.delete(filename) if File.exist?(filename)
    end

    def zip_path(path)
      file_path(path, '.zip')
    end

    def txt_path(path)
      file_path(path, '.txt')
    end

    def file_path(path, extension)
      "#{path}#{extension}"
    end
  end
end
