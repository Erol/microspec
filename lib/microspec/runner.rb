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
  end
end
