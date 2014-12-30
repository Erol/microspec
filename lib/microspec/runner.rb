module Microspec
  class Runner
    def requires
      @_requires ||= []
    end

    def includes
      @_includes ||= []
    end

    def excludes
      @_excludes ||= []
    end

    def filenames
      Dir[*includes] - Dir[*excludes] - requires
    end

    def perform
      requires.each do |filename|
        require File.join Dir.pwd, filename
      end

      filenames.each do |filename|
        load filename
      end
    end
  end
end
