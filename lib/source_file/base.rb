require 'zip'
require_relative '../tree'

module SourceFile
  class Base
    def call(path, format)
      case format
      when /txt/
        txt(path.delete('"'))
      when /zip/
        zip(path.delete('"'))
      end
    rescue Errno::ENOENT => e
      puts(e.message)
    end

    protected

    def delete_file_if_exists(filename)
      File.delete(filename) if File.exist?(filename)
    end

    def zip_path(paht)
      file_path(paht, '.zip')
    end

    def txt_path(paht)
      file_path(paht, '.txt')
    end

    def file_path(paht, extension)
      "#{paht}#{extension}"
    end
  end
end
